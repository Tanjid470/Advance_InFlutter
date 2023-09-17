import 'package:advance_in_flutter/screen/Custom/CustomPainter.dart';
import 'package:advance_in_flutter/screen/Firebase/Login.dart';
import 'package:advance_in_flutter/screen/component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, Color> cardColor = {
    "CustomPainter": Color.fromARGB(255, 104, 243, 224),
    "Firebase": Color.fromARGB(255, 241, 193, 59),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("List"),
      body: SingleChildScrollView(
          child: Container(
            color:  Color.fromARGB(255, 215, 221, 218),
            child: Column(
                  children: [
            card("CustomPainter", const Custompainter()),
            card("Firebase", const Firebase()),
                  ],
                ),
          )),
    );
  }

  GestureDetector card(String s, pageRoute) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => pageRoute,
        ),
      ),
      child: Card(
        color: cardColor[s],
        child: ListTile(
          title: Text(
            s,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
