import 'package:flutter/material.dart';

// import 'package:lolisnatcher/src/handlers/local_auth_handler.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalAuthHandler.instance.authenticate();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LoliSnatcher'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            // LocalAuthHandler.instance.authenticate();
          },
          child: const Icon(
            Icons.lock,
            size: 100,
          ),
        ),
      ),
    );
  }
}
