import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class InitHomePage extends StatefulWidget {
  const InitHomePage({super.key});

  @override
  State<InitHomePage> createState() => _InitHomePageState();
}

class _InitHomePageState extends State<InitHomePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoliSnatcher'),
        leading: const Icon(null),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Expanded(
              flex: 3,
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(strokeWidth: 8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 50),
                child: Obx(
                  () => Text(
                    key: ValueKey(settingsHandler.postInitMessage.value),
                    settingsHandler.postInitMessage.value,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
