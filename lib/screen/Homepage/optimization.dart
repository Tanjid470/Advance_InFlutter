import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:flutter/material.dart';

class Optimization extends StatefulWidget {
  const Optimization({super.key});

  @override
  State<Optimization> createState() => _OptimizationState();
}

class _OptimizationState extends State<Optimization> {

List<String> optimizationTips = [
  "Use the Latest Version of Flutter",
  "Minimize Widget Rebuilds",
  "Use Stateless Widgets",
  "Use Const Keyword",
  "Use the ListView.builder Widget",
  "Optimize Image Loading",
  "Use a State Management Library",
  "Use the Right Data Structures",
  "Optimize the Build Process",
  "Use Lazy Loading",
  "Optimize Animations",
  "Use Asynchronous Operations",
  "Use Performance Analysis Tools",
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("Optimization"),
      body: ListView.builder(
        itemCount: optimizationTips.length,
        itemBuilder: (context, index) {
          return card(optimizationTips[index]); 
      },)
    );
  }

  Card card(String str) {
    return Card(
            color: Colors.grey[100],
            clipBehavior: Clip.hardEdge,

            child: ListTile(
      
              leading: const Icon(Icons.circle,color: Colors.indigo,),
              title: Text(str,style: optimizeText(),),
            ),
          );
  }
}
