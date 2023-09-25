import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/screen/Animations/animation.dart';
import 'package:advance_in_flutter/screen/Custom/CustomPainter.dart';
import 'package:advance_in_flutter/screen/Firebase/Login.dart';
import 'package:advance_in_flutter/screen/Homepage/optimization.dart';
import 'package:advance_in_flutter/screen/Maps/map.dart';
import 'package:advance_in_flutter/screen/PermissionHandler/permissionHandler.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Color> cardColor = {
    "CustomPainter": const Color.fromARGB(255, 104, 243, 224),
    "Firebase":const Color.fromARGB(255, 241, 193, 59),
    "GoogleMap":const Color.fromARGB(255, 105, 150, 233),
    "Permission":const Color.fromARGB(255, 212, 134, 134),
    "Animitions":const Color.fromARGB(255, 118, 236, 171),
    "Optimize" :Color.fromARGB(255, 240, 105, 217)
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("Advance List"),
      body: SingleChildScrollView(
          child: Container(
        color:const Color.fromARGB(255, 215, 221, 218),
        child: Column(
          children: [
            card("CustomPainter", const Custompainter()),
            card("Firebase", const Firebase()),
            card("GoogleMap",const GoogleMapFree()),
            card("Permission", const PermissionHandler()),
            card("Animitions", const AnimationClass()),
            card("Optimization", const Optimization()),
        
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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
