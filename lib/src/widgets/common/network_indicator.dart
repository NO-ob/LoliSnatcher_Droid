import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lolisnatcher/gen/strings.g.dart';

import 'package:lolisnatcher/src/handlers/connectivity_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class NetworkIndicator extends StatelessWidget {
  const NetworkIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivityHandler = ConnectivityHandler.instance;

    return Obx(() {
      if (connectivityHandler.isOnline.value) {
        return const SizedBox.shrink();
      }

      return SettingsButton(
        name: context.loc.settings.network.noConnection,
        icon: const Icon(Icons.wifi_off, color: Colors.redAccent),
        action: () {},
      );
    });
  }
}
