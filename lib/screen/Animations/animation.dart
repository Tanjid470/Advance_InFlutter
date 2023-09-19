import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/constants/app_colors.dart';
import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:advance_in_flutter/screen/Animations/widget/animatedAlign.dart';
import 'package:advance_in_flutter/screen/Animations/widget/animationCrossFade.dart';
import 'package:flutter/material.dart';


class AnimationClass extends StatefulWidget {
  const AnimationClass({super.key});

  @override
  State<AnimationClass> createState() => _AnimationClassState();
}

class _AnimationClassState extends State<AnimationClass> {
  bool selected = false;
  bool animatedCrossfade = true;

  double textSize=25;
  Color textColor=Colors.blue;
  bool fontBool=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("Animitions"),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.bgcolor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Center(
                child: Text(
                  "AnimatedAlign",
                  style: animatedTitle(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: animatedAlign(selected),
              ),
              Center(
                child: Text(
                  "AnimatedCrossFade",
                  style: animatedTitle(),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    animatedCrossfade = !animatedCrossfade;
                  });
                },
                child: Center(
                  child: Text(
                    "switch",
                    style:textTitle(),
                  ),
                ),
              ),
              animatedCrossFade(animatedCrossfade),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.transparent,
                child: animatedTextStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedDefaultTextStyle animatedTextStyle() {
    return AnimatedDefaultTextStyle(
                  style: TextStyle(
                    fontSize:textSize,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  duration: const Duration(seconds: 1),
                  child: GestureDetector(
                    child: const Center(child: Text("Tanjid")),
                    onTap: () {
                      setState(() {
                        textSize = fontBool ? 25:35;
                      textColor=fontBool?Colors.blue:Colors.red;
                      fontBool=!fontBool;
                      });     
                    },
                  ));
  }
}
