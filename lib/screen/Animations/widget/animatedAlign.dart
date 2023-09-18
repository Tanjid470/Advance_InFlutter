// ignore: file_names
import 'package:flutter/material.dart';




Container animatedAlign(bool isSelected) {
  bool selected=isSelected;
    return Container(
              height: 80,
              width: double.infinity,
              color: Colors.transparent,
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