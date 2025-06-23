import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/pages/settings/booru_page.dart';
import 'package:lolisnatcher/src/pages/settings_page.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

// TODO named routes

Future<bool> internalRouting(
  BuildContext context,
  String link,
) async {
  link = link.replaceAll(RegExp(r'\/+$'), '').replaceAll(RegExp(r'^\/+'), '');
  final parts = link.split('/');

  if (parts.isEmpty) return false;

  // TODO
  switch (parts[0]) {
    case 'settings':
      if (parts.length > 1) {
        switch (parts[1]) {
          case 'booru':
            await SettingsPageOpen(
              context: context,
              page: (_) => const BooruPage(),
            ).open();
            return true;
          default:
            break;
        }
      } else {
        await SettingsPageOpen(
          context: context,
          page: (_) => const SettingsPage(),
        ).open();
        return true;
      }
      break;
    default:
      break;
  }

  return false;
}
