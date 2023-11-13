import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/widgets/update_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/profile_menu_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences preferences;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
    });
  }

  void logout() {
    preferences.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_left_outlined)),
          title: const Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.sunny : Icons.brightness_2),
            ),
          ],
          elevation: 0,
          // backgroundColor: Colors.red[900],
          titleSpacing: 2,
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
                      Text(preferences.getString('token').toString()),
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
                                Icons.edit,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(preferences.getString('name').toString()),
                      Text(preferences.getString('email').toString()),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdateProfileScreen(prefs: preferences)),
                          ),
                          child: const Text("Edit profile"),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 10),
                      ProfileMenuWidget(
                        title: 'Settings',
                        icon: Icons.settings,
                        textColor: Colors.black,
                        onPress: () {},
                      ),
                      ProfileMenuWidget(
                        title: 'Billing Details',
                        icon: Icons.wallet_outlined,
                        textColor: Colors.black,
                        onPress: () {},
                      ),
                      ProfileMenuWidget(
                        title: 'User Management',
                        icon: Icons.verified_user,
                        textColor: Colors.black,
                        onPress: () {},
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileMenuWidget(
                        title: 'Information',
                        icon: Icons.info,
                        textColor: Colors.black,
                        onPress: () {},
                      ),
                      ProfileMenuWidget(
                        title: 'Logout',
                        icon: Icons.logout_outlined,
                        onPress: () {
                          logout();
                        },
                        textColor: Colors.red,
                        endIcon: false,
                      ),
                    ],
                  ),
                ),
        ));
  }
}
