// ignore: file_names
import 'package:flutter/material.dart';




Container animatedAlign(bool isSelected) {
  bool selected=isSelected;
    return Container(
              height: 60,
              margin:const EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.transparent,boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  color: Color.fromARGB(255, 59, 78, 177),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 5,

                )
              ]),
              child: AnimatedAlign(
                alignment:
                    selected ? Alignment.centerLeft : Alignment.centerRight,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInExpo,
                child: const FlutterLogo(
                  size: 50,
                ),
              ),
            );
  }