import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:advance_in_flutter/screen/Custom/Draw/Circle.dart';
import 'package:advance_in_flutter/screen/Custom/Draw/PeiChart.dart';

import 'package:flutter/material.dart';

class Custompainter extends StatefulWidget {
  const Custompainter({super.key});

  @override
  State<Custompainter> createState() => _CustompainterState();
}

class _CustompainterState extends State<Custompainter> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final List<DataItem> dataset = [
      DataItem(.225, Color.fromARGB(255, 235, 86, 86), "Java"),
      DataItem(.075, Color.fromARGB(255, 187, 80, 206), "C"),
      DataItem(.2, Color.fromARGB(255, 235, 163, 55), "CP"),
      DataItem(.1, const Color.fromARGB(255, 84, 216, 88), "C++"),
      DataItem(.125, const Color.fromARGB(255, 74, 161, 231), "Flutter"),
      DataItem(.175, const Color.fromARGB(255, 75, 221, 206), "DSA"),
      DataItem(.1, const Color.fromARGB(255, 219, 85, 130), "Math"),
    ];
    return Scaffold(
      appBar: appBarTitle("Custom Painter"),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Color.fromARGB(255, 215, 221, 218),
            child: Container(),
          ),
          Container(
           padding: EdgeInsets.all(5),
            height: height / 3 - 20,
            width: width,
            color: Colors.transparent,
            child: GridView.builder(
              gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 170,
                  childAspectRatio: 7/4 ,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
                  itemCount: dataset.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                 // padding: EdgeInsets.all(5),
                  decoration: BoxDecoration( color: dataset[index].color,borderRadius: BorderRadius.circular(8)),
                  height: 42,
                 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dataset[index].label,
                        style: textStyleSkill(dataset, index),
                      ),
                      Text(
                        "  ${(dataset[index].value * 100).toString()}%",
                        style: textStyleSkill(dataset, index),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: height / 2,
            width: width / 2,
            child: CustomPaint(
              painter: PeiChart(dataset),
            ),
          ),
          Container(
            child: CustomPaint(
              painter:
                  Circle(MediaQuery.of(context).size.width / 2, height / 2),
            ),
          ),
          Positioned(
              top: height / 2 - 15,
              right: width / 2 - 20,
              child: Text(
                "Skill",
                style: textStyleCenter(),
              ))
        ],
      ),
    );
  }
}
