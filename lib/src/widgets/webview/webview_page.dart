import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_navigation_controls.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_navigation_menu.dart';

WebViewEnvironment? webViewEnvironment;
Map<String, List<Cookie>> globalWindowsCookies = {};

class InAppWebviewView extends StatefulWidget {
  const InAppWebviewView({
    required this.initialUrl,
    this.userAgent,
    this.title,
    this.subtitle,
    super.key,
  });

  final String initialUrl;
  final String? userAgent;
  final String? title;
  final String? subtitle;

  @override
  State<InAppWebviewView> createState() => _InAppWebviewViewState();
}

class _InAppWebviewViewState extends State<InAppWebviewView> {
  final GlobalKey webViewKey = GlobalKey();

  Completer<InAppWebViewController> controller = Completer<InAppWebViewController>();
  late final InAppWebViewSettings settings;

  PullToRefreshController? pullToRefreshController;
  int loadingPercentage = 0;
  bool hideSubtitle = false;

  @override
  void initState() {
    super.initState();

    settings = InAppWebViewSettings(
      userAgent: widget.userAgent ?? Tools.browserUserAgent,
      mediaPlaybackRequiresUserGesture: false,
      javaScriptEnabled: true,
      cacheEnabled: false,
      useHybridComposition: true,
      allowsInlineMediaPlayback: true,
      useShouldInterceptAjaxRequest: false,
    );

    if (Platform.isAndroid || Platform.isIOS) {
      pullToRefreshController = PullToRefreshController(
        settings: PullToRefreshSettings(
          color: Colors.blue,
        ),
        onRefresh: () async {
          if (Platform.isAndroid) {
            await controller.future.then((controller) {
              controller.reload();
            });
          } else if (Platform.isIOS) {
            await controller.future.then((controller) async {
              await controller.loadUrl(urlRequest: URLRequest(url: await controller.getUrl()));
            });
          }
        },
      );
    }
  }

  Future<void> saveCookiesOnWidnows(
    InAppWebViewController controller,
    WebUri? uri,
  ) async {
    // dirty workaround to keep cookies in memory outside of webview pages, to allow getting them in image/auth logic
    // probably should redo cookie logic to store them independently from webview implementation
    if (Platform.isWindows && uri != null) {
      final cookies = await CookieManager.instance(webViewEnvironment: webViewEnvironment).getCookies(
        url: uri,
        webViewController: controller,
      );

      if (globalWindowsCookies[uri.host] == null) {
        globalWindowsCookies[uri.host] = [];
      } else {
        globalWindowsCookies[uri.host]!.clear();
      }

      globalWindowsCookies[uri.host]!.addAll(cookies);

      setState(() {});
    }
  }

  @override
  void dispose() {
    pullToRefreshController?.dispose();
    controller.future.then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Webview'),
        actions: [
          WebviewNavigationControls(controller: controller),
          WebviewNavigationMenu(initialUrl: widget.initialUrl, controller: controller),
        ],
      ),
      body: Stack(
        children: [
          if (Tools.isOnPlatformWithWebviewSupport)
            InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(widget.initialUrl)),
              initialSettings: settings,
              pullToRefreshController: pullToRefreshController,
              webViewEnvironment: webViewEnvironment,
              onWebViewCreated: (webViewController) {
                controller.complete(webViewController);
                // webViewController.clearCache();
              },
              onLoadStart: (controller, url) {
                setState(() {
                  loadingPercentage = 0;
                });
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  loadingPercentage = progress;
                });
              },
              onLoadResource: (controller, res) {
                setState(() {
                  loadingPercentage = 100;
                });
              },
              onLoadStop: (controller, url) {
                setState(() {
                  loadingPercentage = 100;
                  saveCookiesOnWidnows(controller, url);
                });
              },
              onUpdateVisitedHistory: (controller, url, isReload) {
                setState(() {
                  loadingPercentage = 0;
                });
              },
            )
          else
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: const Center(
                child: Text('Not supported on this device'),
              ),
            ),
          //
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
          //
          if (Platform.isWindows && !hideSubtitle)
            Positioned(
              top: MediaQuery.paddingOf(context).top + 8,
              left: 8,
              child: Container(
                width: MediaQuery.sizeOf(context).width - 16,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 100,
                        child: ListView(
                          children: [
                            Text(
                              globalWindowsCookies[WebUri(widget.initialUrl).host]
                                      ?.map((e) => '${e.name}\n->\n${e.value}')
                                      .join('\n\n') ??
                                  '',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 22,
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          hideSubtitle = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (widget.subtitle != null && !hideSubtitle)
            Positioned(
              bottom: MediaQuery.paddingOf(context).bottom + 8,
              left: 8,
              child: Container(
                width: MediaQuery.sizeOf(context).width - 16,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        widget.subtitle!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 22,
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          hideSubtitle = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
