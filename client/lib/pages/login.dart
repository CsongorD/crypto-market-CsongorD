// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/methods/api.dart';
import 'package:frontend/pages/profile.dart';
import 'package:frontend/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void loginUser() async {
    final data = {
      'email': email.text.toString(),
      'password': password.text.toString(),
    };
    final result = await API().postRequest(route: '/login', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userId', response['user']['id']);
      await prefs.setString('name', response['user']['name']);
      await prefs.setString('email', response['user']['email']);
      await prefs.setString('phone', response['user']['phone']);
      await prefs.setString('token', response['token']);
      await prefs.setBool('is_logged_in', true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['message']),
        ),
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Profile(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[400],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 300,
                  child: TextFormField(
                    controller: email,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: 'Enter your email',
                    ),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.all(10),
                //   width: 300,
                //   child: TextFormField(
                //     controller: name,
                //     style: const TextStyle(
                //       color: Colors.white,
                //     ),
                //     cursorColor: Colors.white,
                //     decoration: const InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white)),
                //       labelStyle: TextStyle(color: Colors.white),
                //       iconColor: Colors.white,
                //       hintStyle: TextStyle(color: Colors.white),
                //       labelText: 'Enter your username',
                //     ),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 300,
                  child: TextFormField(
                    controller: password,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: 'Enter your password',
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                      ),
                      onPressed: () => {
                            loginUser(),
                          },
                      child: const Text("Sign in")),
                ),
                const Text('Or'),
                TextButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register())),
                        },
                    child: const Text("Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
