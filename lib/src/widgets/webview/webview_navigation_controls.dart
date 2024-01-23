import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewNavigationControls extends StatelessWidget {
  const WebviewNavigationControls({required this.controller, super.key});

  final Completer<InAppWebViewController> controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InAppWebViewController>(
      future: controller.future,
      builder: (context, snapshot) {
        final InAppWebViewController? controller = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done || controller == null) {
          return const Row(
            children: [
              Icon(Icons.arrow_back_ios),
              Icon(Icons.arrow_forward_ios),
              Icon(Icons.replay),
            ],
          );
        }

        return Row(
          children: [
            GestureDetector(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => WebviewHistoryDialog(
                    controller: controller,
                    onSelect: (String url) {
                      controller.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
                    },
                  ),
                );
              },
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No back history item')),
                    );
                    return;
                  }
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No forward history item')),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: controller.reload,
            ),
          ],
        );
      },
    );
  }
}

class WebviewHistoryDialog extends StatefulWidget {
  const WebviewHistoryDialog({
    required this.controller,
    required this.onSelect,
    super.key,
  });

  final InAppWebViewController controller;
  final Function(String) onSelect;

  @override
  State<WebviewHistoryDialog> createState() => _WebviewHistoryDialogState();
}

class _WebviewHistoryDialogState extends State<WebviewHistoryDialog> {
  WebHistory? _history;
  // int? _currentIndex;
  // WebHistoryItem? _currentItem;
  List<WebHistoryItem> _historyItems = [];

  @override
  void initState() {
    super.initState();

    widget.controller.getCopyBackForwardList().then((history) {
      setState(() {
        _history = history;
        _historyItems = _history?.list ?? [];
        // _currentIndex = _history?.currentIndex;
        // _currentItem = _history?.list?[_currentIndex ?? 0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('History'),
      content: ListView.builder(
        itemCount: _historyItems.length,
        itemBuilder: (context, index) {
          final item = _historyItems[index];
          return ListTile(
            title: Text(item.url.toString()),
            subtitle: Text(item.title ?? ''),
            onTap: () {
              widget.onSelect(item.url.toString());
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
