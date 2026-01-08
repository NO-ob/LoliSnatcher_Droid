import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

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
  final CookieManager cookieManager = CookieManager.instance(webViewEnvironment: webViewEnvironment);
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
              labelText: context.loc.webview.navigation.enterUrlLabel,
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
              child: Text(context.loc.cancel),
              onPressed: () => Navigator.pop(context, null),
            ),
            ElevatedButton(
              child: Text(context.loc.go),
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
    final List<Cookie> cookies = await cookieManager.getCookies(
      url: await controller.getUrl() ?? WebUri('https://flutter.dev'),
      webViewController: controller,
    );
    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.loc.webview.navigation.cookies),
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
    await cookieManager.deleteCookies(
      url: WebUri.uri(url),
      webViewController: controller,
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.loc.webview.navigation.cookiesGone),
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
          title: Text(context.loc.webview.navigation.favicon),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                SelectableText(
                  favicon ?? context.loc.webview.navigation.noFaviconFound,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(context.loc.webview.navigation.host),
                SelectableText(
                  '${uri?.scheme}://${uri?.host}',
                ),
                Text(context.loc.webview.navigation.textAboveSelectable),
                const Text(''),
                Text(context.loc.webview.navigation.fieldToMergeTexts),
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
        SnackBar(
          content: Text(context.loc.webview.navigation.copiedUrlToClipboard),
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
              child: Text(context.loc.webview.navigation.navigateTo(url: widget.initialUrl)),
            ),
            PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.enterCustomUrl,
              child: Text(context.loc.webview.navigation.enterCustomUrl),
            ),
            PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.listCookies,
              child: Text(context.loc.webview.navigation.listCookies),
            ),
            PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.clearCookies,
              child: Text(context.loc.webview.navigation.clearCookies),
            ),
            PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.getFavicon,
              child: Text(context.loc.webview.navigation.getFavicon),
            ),
            PopupMenuItem<_NavigationMenuOptions>(
              value: _NavigationMenuOptions.copyUrl,
              child: Text(context.loc.webview.navigation.copyUrl),
            ),
          ],
        );
      },
    );
  }
}
