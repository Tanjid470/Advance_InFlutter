import 'package:advance_in_flutter/screen/component.dart';
import 'package:flutter/material.dart';

class Firebase extends StatefulWidget {
  const Firebase({super.key});

  @override
  State<Firebase> createState() => _FirebaseState();
}

class _FirebaseState extends State<Firebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("Firebase"),
      body: Center(
        child: Container(
          child: Text("Firebase"),
        ),
      ),
    );
  }
}