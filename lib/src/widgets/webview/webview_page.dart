import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_navigation_controls.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_navigation_menu.dart';

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
  late final InAppWebViewGroupOptions options;

  late PullToRefreshController pullToRefreshController;
  int loadingPercentage = 0;
  bool hideSubtitle = false;

  @override
  void initState() {
    super.initState();

    options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        userAgent: widget.userAgent ?? Tools.browserUserAgent,
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        javaScriptEnabled: true,
        cacheEnabled: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ),
    );

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'InAppWebview'),
        actions: [
          WebviewNavigationControls(controller: controller),
          WebviewNavigationMenu(initialUrl: widget.initialUrl, controller: controller),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.initialUrl)),
            initialOptions: options,
            pullToRefreshController: pullToRefreshController,
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
            onUpdateVisitedHistory: (controller, url, isReload) {
              setState(() {
                loadingPercentage = 0;
              });
            },
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
          if (widget.subtitle != null && !hideSubtitle)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 8,
              left: 8,
              child: Container(
                width: MediaQuery.of(context).size.width - 16,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
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
