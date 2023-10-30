import 'package:flutter/material.dart';
import 'package:frontend/pages/Login.dart';
import 'package:frontend/pages/Profile.dart';
import 'pages/home.dart';
//import 'pages/loading.dart';

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
