// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:frontend/pages/Login.dart';
import 'package:frontend/pages/Logout.dart';
import 'package:frontend/widgets/CryptoList.dart';
import 'package:frontend/widgets/landing.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Crypto Market",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.red[900],
        titleSpacing: 2,
        leading: const Icon(Icons.currency_bitcoin),
        actions: [
          IconButton(
              onPressed: () {
                if (isLoggedIn) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Logout()));
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                }
              },
              icon: isLoggedIn
                  ? const Icon(Icons.logout)
                  : const Icon(Icons.fingerprint)),
        ],
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Landing(),
              CryptoList(),
            ],
          ),
        ),
      ),
    );
  }
}
