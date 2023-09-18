import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:flutter/material.dart';

class AnimationClass extends StatefulWidget {
  const AnimationClass({super.key});

  @override
  State<AnimationClass> createState() => _AnimationClassState();
}

class _AnimationClassState extends State<AnimationClass> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("Animitions"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Center(child: Text("AnimatedAlign",style: animatedTitle(),),),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.indigo,
                child: AnimatedAlign(
                  alignment:
                      selected ? Alignment.centerLeft : Alignment.centerRight,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInExpo,
                  child: const FlutterLogo(
                    size: 50,
                  ),
                ),
              ),
            ),
            Center(child: Text("AnimatedAlign",style: animatedTitle(),),),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
