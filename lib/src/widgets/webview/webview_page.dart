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
    super.key,
  });

  final String initialUrl;
  final String? userAgent;
  final String? title;

  @override
  State<InAppWebviewView> createState() => _InAppWebviewViewState();
}

class _InAppWebviewViewState extends State<InAppWebviewView> {
  final GlobalKey webViewKey = GlobalKey();

  Completer<InAppWebViewController> controller = Completer<InAppWebViewController>();
  late final InAppWebViewGroupOptions options;

  late PullToRefreshController pullToRefreshController;
  int loadingPercentage = 0;

  @override
  void initState() {
    super.initState();

    options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        userAgent: widget.userAgent ?? Tools.browserUserAgent(),
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
          controller.future.then((controller) {
            controller.reload();
          });
        } else if (Platform.isIOS) {
          controller.future.then((controller) async {
            controller.loadUrl(urlRequest: URLRequest(url: await controller.getUrl()));
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
        ],
      ),
    );
  }
}
