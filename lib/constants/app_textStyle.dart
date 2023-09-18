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
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 25, 26, 26)
  ); 
}

TextStyle animatedTitle(){
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.teal
  ); 
}
