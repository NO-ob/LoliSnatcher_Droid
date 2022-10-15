import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum _NavigationMenuOptions {
  goToInitial,
  enterCustomUrl,
  listCookies,
  clearCookies,
}

class WebviewNavigationMenu extends StatefulWidget {
  const WebviewNavigationMenu({
    required this.initialUrl,
    required this.controller,
    super.key,
  });

  final String initialUrl;
  final Completer<InAppWebViewController> controller;

  @override
  State<WebviewNavigationMenu> createState() => _WebviewNavigationMenuState();
}

class _WebviewNavigationMenuState extends State<WebviewNavigationMenu> {
  final CookieManager cookieManager = CookieManager();
  final TextEditingController _urlController = TextEditingController();

  Future<void> _onGoToInitial(InAppWebViewController controller) async {
    await controller.loadUrl(urlRequest: URLRequest(url: Uri.parse(widget.initialUrl)));
  }

  Future<void> _onEnterCustomUrl(InAppWebViewController controller) async {
    _urlController.text = (await controller.getUrl())?.toString() ?? '';

    String? url = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: _urlController,
            decoration: InputDecoration(
              labelText: 'Enter a URL',
              border: const OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () {
                  _urlController.clear();
                },
                child: Icon(Icons.clear, color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            keyboardType: TextInputType.url,
            textCapitalization: TextCapitalization.none,
            autofocus: true,
          ),
          actions: [
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context, null),
            ),
            ElevatedButton(
              child: const Text('Go'),
              onPressed: () => Navigator.pop(context, _urlController.text),
            ),
          ],
        );
      },
    );
    if (url != null) {
      if (!url.startsWith('https')) {
        url = 'https://$url';
      }
      await controller.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
    }
  }

  Future<void> _onListCookies(InAppWebViewController controller) async {
    final List<Cookie> cookies = await cookieManager.getCookies(url: await controller.getUrl() ?? Uri.parse('https://flutter.dev'));
    if (!mounted) return;

    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Cookies'),
        content: SingleChildScrollView(
          child: ListBody(
            children: cookies.map((Cookie cookie) {
              return Text(
                '${cookie.name} = ${cookie.value}',
                style: const TextStyle(fontSize: 16),
              );
            }).toList(),
          ),
        ),
        actions: const [
          CloseButton()
        ],
      );
    });
  }

  Future<void> _onClearCookies(InAppWebViewController controller) async {
    // TODO doesn't work? maybe something related to android 12?
    Uri url = await controller.getUrl() ?? Uri.parse('https://flutter.dev');
    print('Clearing cookies for $url');
    await cookieManager.deleteCookies(url: url);
    String message = 'There were cookies. Now, they are gone!';
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InAppWebViewController>(
      future: widget.controller.future,
      builder: (context, controller) {
        return PopupMenuButton<_NavigationMenuOptions>(
          onSelected: (value) async {
            switch (value) {
              case _NavigationMenuOptions.goToInitial:
                await _onGoToInitial(controller.data!);
                break;
              case _NavigationMenuOptions.enterCustomUrl:
                await _onEnterCustomUrl(controller.data!);
                break;
              case _NavigationMenuOptions.listCookies:
                await _onListCookies(controller.data!);
                break;
              case _NavigationMenuOptions.clearCookies:
                await _onClearCookies(controller.data!);
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.goToInitial,
              child: Text('Navigate to ${widget.initialUrl}'),
            ),
            const PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.enterCustomUrl,
              child: Text('Enter custom URL'),
            ),
            const PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.listCookies,
              child: Text('List cookies'),
            ),
            const PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.clearCookies,
              child: Text('Clear cookies'),
            ),
          ],
        );
      },
    );
  }
}
