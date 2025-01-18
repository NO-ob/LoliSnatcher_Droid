import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum _NavigationMenuOptions {
  goToInitial,
  enterCustomUrl,
  listCookies,
  clearCookies,
  getFavicon,
  copyUrl,
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
  final CookieManager cookieManager = CookieManager.instance();
  final TextEditingController _urlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _onGoToInitial(InAppWebViewController controller) async {
    await controller.loadUrl(urlRequest: URLRequest(url: WebUri(widget.initialUrl)));
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
                onTap: _urlController.clear,
                child: Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
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
      if (!url.startsWith('https') && !url.startsWith('http')) {
        url = 'https://$url';
      }
      await controller.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
    }
  }

  Future<void> _onListCookies(InAppWebViewController controller) async {
    final List<Cookie> cookies = await cookieManager.getCookies(url: await controller.getUrl() ?? WebUri('https://flutter.dev'));
    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
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
            CloseButton(),
          ],
        );
      },
    );
  }

  Future<void> _onClearCookies(InAppWebViewController controller) async {
    // TODO doesn't work? maybe something related to android 12?
    final Uri url = await controller.getUrl() ?? WebUri('https://flutter.dev');
    print('Clearing cookies for $url');
    await cookieManager.deleteCookies(url: WebUri.uri(url));
    const String message = 'There were cookies. Now, they are gone!';
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _onGetFavicon(InAppWebViewController controller) async {
    final String? html = await controller.getHtml();
    if (!mounted) return;

    String? favicon;
    if (html != null) {
      final RegExp faviconRegex = RegExp(
        '<link rel="(?:shortcut icon|icon|)" href="([^"]+)"',
        caseSensitive: false,
      );
      final RegExpMatch? match = faviconRegex.firstMatch(html);
      if (match != null) {
        favicon = match.group(1);
      }
    }

    final Uri? uri = await controller.getUrl();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Favicon'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                SelectableText(
                  favicon ?? 'No favicon found',
                  style: const TextStyle(fontSize: 16),
                ),
                const Text('Host:'),
                SelectableText(
                  '${uri?.scheme}://${uri?.host}',
                ),
                const Text('(text above is selectable)'),
                const Text(''),
                const Text('Field to merge texts:'),
                const TextField(),
              ],
            ),
          ),
          actions: const [
            CloseButton(),
          ],
        );
      },
    );
  }

  Future<void> _onCopyUrl(InAppWebViewController controller) async {
    final String? url = (await controller.getUrl())?.toString();
    if (url != null) {
      await Clipboard.setData(ClipboardData(text: url));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied URL to clipboard'),
        ),
      );
    }
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
              case _NavigationMenuOptions.getFavicon:
                await _onGetFavicon(controller.data!);
                break;
              case _NavigationMenuOptions.copyUrl:
                await _onCopyUrl(controller.data!);
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
            const PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.getFavicon,
              child: Text('Get favicon'),
            ),
            const PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.copyUrl,
              child: Text('Copy URL'),
            ),
          ],
        );
      },
    );
  }
}
