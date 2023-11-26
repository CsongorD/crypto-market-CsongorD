import 'package:flutter/material.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/pages/profile.dart';
import 'package:frontend/widgets/biometric_lock.dart';
import 'package:frontend/widgets/crypto_list.dart';
import 'package:frontend/widgets/landing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences preferences;
  bool isLoggedIn = false;
  bool isLoading = false;
  bool isAuthenticated = false;
  bool isBiometricsEnabled = false;

  @override
  void initState() {
    super.initState();
    getUserLoginState();
  }

  void getUserLoginState() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
      isLoggedIn = preferences.getBool('is_logged_in').toString() == 'true'
          ? true
          : false;
      isBiometricsEnabled =
          preferences.getBool("is_biometrics_enabled").toString() == "true"
              ? true
              : false;
    });
  }

  void authenticate(authenticate) {
    setState(() {
      isAuthenticated = authenticate;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        // backgroundColor: Colors.red[900],
        titleSpacing: 2,
        leading: const Icon(Icons.currency_bitcoin),
        actions: [
          isLoggedIn
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                  icon: const Icon(Icons.account_box),
                )
              : IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.fingerprint),
                ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : isLoggedIn && isBiometricsEnabled && !isAuthenticated
                    ? BiometricLock(
                        authenticate: authenticate,
                      )
                    : const Column(children: <Widget>[
                        Landing(),
                        CryptoList(),
                      ])),
      ),
    );
  }
}
