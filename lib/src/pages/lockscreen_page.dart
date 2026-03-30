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
            body: GestureDetector(
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
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      context.loc.lockscreen.tapToAuthenticate,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                    if (kDebugMode || EnvironmentConfig.isTesting) ...[
                      ElevatedButton(
                        onPressed: () {
                          LocalAuthHandler.instance.authenticate(forceUnlock: true);
                        },
                        child: Text(context.loc.lockscreen.devUnlock),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Text(
                          context.loc.lockscreen.testingMessage,
                        ),
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
    );
  }
}
