import 'package:flutter/material.dart';

class BucketPage extends StatefulWidget {
  @override
  State<BucketPage> createState() => _BucketPageState();
}

class _BucketPageState extends State<BucketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Cart"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.shade200,
      ),
      body: Center(child: Text("Bucket Page")),
    );
  }
}
