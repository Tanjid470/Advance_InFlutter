import 'package:advance_in_flutter/screen/Custom/Draw/PeiChart.dart';
import 'package:flutter/material.dart';

TextStyle textStyleCenter(){
  return const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );
}
TextStyle textStyleSkill(List<DataItem> dataset, int index){
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  
  );
}
TextStyle textButton(){
  return const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );
  
}
TextStyle textButton2(){
  return const TextStyle(
    fontSize: 17.5,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 223, 226, 226)
  ); 
}
TextStyle textTitle(){
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.indigo
  ); 
}
TextStyle floatButtonText(){
  return const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 32, 32, 32)
  ); 
}

TextStyle animatedTitle(){
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.teal
  ); 
}
TextStyle optimizeText(){
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 34, 35, 37)
  ); 
}
TextStyle googleMapButton(){
  return const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 34, 35, 37)
  ); 
}
