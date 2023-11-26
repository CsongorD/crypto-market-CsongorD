import 'package:flutter/material.dart';
import 'package:frontend/services/local_auth_service.dart';

class BiometricLock extends StatelessWidget {
  final Function authenticate;
  const BiometricLock({super.key, required this.authenticate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.greenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            height: 50,
          ),
          const Icon(
            Icons.lock,
            size: 50,
          ),
          const Text("Crypto Market locked"),
          const Divider(
            height: 150,
          ),
          ElevatedButton(
            onPressed: () async {
              final authenticated = await LocalAuth.authenticate();
              authenticate(authenticated);
            },
            child: const Text("Login"),
          ),
          const Text("Touch the fingerprint sensor")
        ],
      ),
    );
  }
}
