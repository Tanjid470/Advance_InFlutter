import 'package:flutter/material.dart';

AppBar appBarTitle(String title) {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 215, 220, 226),
              Color.fromARGB(255, 230, 234, 238),
              Color.fromARGB(255, 223, 233, 243),
            ]),
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    ),
    centerTitle: true,
  );
}
