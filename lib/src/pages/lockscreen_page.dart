import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/local_auth_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class LockScreenPage extends StatelessWidget {
  const LockScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ValueListenableBuilder(
        valueListenable: LocalAuthHandler.instance.isAuthenticated,
        builder: (context, isAuthenticated, child) {
          if (isAuthenticated != false) {
            return const SizedBox.shrink();
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(const Duration(milliseconds: 400)).then((_) {
                LocalAuthHandler.instance.authenticate(initial: true);
              });
            });

            return child!;
          }
        },
        child: PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: SettingsHandler.instance.shitDevice ? null : Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.33),
            body: BackdropFilter(
              enabled: !SettingsHandler.instance.shitDevice,
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: GestureDetector(
                onTap: LocalAuthHandler.instance.authenticate,
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      const Spacer(),
                      Center(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: LocalAuthHandler.instance.authenticate,
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.fingerprint,
                              size: 100,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Tap to unlock',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Spacer(),
                      if (kDebugMode) ...[
                        ElevatedButton(
                          onPressed: () {
                            LocalAuthHandler.instance.authenticate(forceUnlock: true);
                          },
                          child: const Text('DEV UNLOCK'),
                        ),
                        const Spacer(),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
