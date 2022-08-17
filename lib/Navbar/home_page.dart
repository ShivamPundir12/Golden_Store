import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueAccent.shade400,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Text("HOME"),
        alignment: Alignment.center,
      ),
    );
  }
}
