// ignore: file_names
import 'package:flutter/material.dart';


AnimatedCrossFade animatedCrossFade(bool acf) {
  bool animatedCrossfade=acf;
    return AnimatedCrossFade(
                firstChild:Container(
            height: 200,
            width: double.maxFinite,
            decoration: const BoxDecoration(
        
                image: DecorationImage(
                    image: NetworkImage(
                        "https://static.vecteezy.com/system/resources/previews/001/265/731/original/map-with-location-pin-vector.jpg"),
                    fit: BoxFit.fill)),
              ),
                secondChild:   Container(
            height: 200,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpGEIuyb0-ESKunEN40NasZkMO0etsCHxk3A&usqp=CAU"),
                      //  "https://static.vecteezy.com/system/resources/previews/001/265/731/original/map-with-location-pin-vector.jpg"),
                    fit: BoxFit.fill)),
              ),
                crossFadeState: animatedCrossfade
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 2));
  }