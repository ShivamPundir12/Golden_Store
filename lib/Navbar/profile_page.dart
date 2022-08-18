import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:golden_store/pages/login_page.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async => {
              await Duration(seconds: 5),
              await FirebaseAuth.instance.signOut(),
              await storage.delete(key: "email"),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyLogin(),
                  ),
                  (route) => false),
            },
            tooltip: "Logout",
            icon: Icon(
              CupertinoIcons.power,
              color: Colors.black54,
              size: 24,
            ),
          )
        ],
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
        ),
        backgroundColor: Colors.blue.shade400,
        centerTitle: true,
      ),
      body: Center(child: Text("Profile page")),
    );
  }
}
