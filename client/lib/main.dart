import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/pages/profile.dart';

// import 'package:frontend/pages/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        // "/": (context) =>  const Loading(),
        '/home': (context) => const Home(),
        '/login': (context) => const Login(),
        '/profile': (context) => const Profile(),
      },
    ),
  );
}
