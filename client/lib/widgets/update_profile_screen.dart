// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methods/api.dart';
import '../pages/profile.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool isLoading = false;
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  int? userId;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    var preferences = await SharedPreferences.getInstance();
    userId = preferences.getInt('userId');
    var user = await getUserById(userId);

    userId = user["id"];
    name = user["name"];
    email = user["email"];
    phone = user["phone"];

    setState(() {
      isLoading = false;
    });
  }

  getUserById(userId) async {
    final result = await API().getUser(userId: userId);
    return jsonDecode(result.body);
  }

  void updateProfile() async {
    final data = {
      'id': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };


    final result = await API().putRequest(route: '/update-profile', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_left_outlined)),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const SizedBox(
                          width: 120,
                          height: 120,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.jpg'),
                            radius: 60,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          initialValue: name != 'null' ? name : '',
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              label: const Text('Username'),
                              prefixIcon: const Icon(Icons.account_box)),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          initialValue: email != 'null' ? email : '',
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              label: const Text('E-mail'),
                              prefixIcon: const Icon(Icons.email)),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              phone = value;
                            });
                          },
                          initialValue: phone != 'null' ? phone : '',
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              label: const Text("Phone Number"),
                              prefixIcon: const Icon(Icons.phone)),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          initialValue: password != 'null' ? password : '',
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              label: const Text("Password"),
                              prefixIcon: const Icon(Icons.fingerprint)),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              updateProfile();
                            },
                            child: const Text("Save"),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
      ),
    );
  }
}
