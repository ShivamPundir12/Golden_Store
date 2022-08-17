import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
