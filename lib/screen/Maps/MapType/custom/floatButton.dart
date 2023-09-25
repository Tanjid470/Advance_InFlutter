
import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:flutter/material.dart';

FloatingActionButton floatingbutton(BuildContext context,String str,  pageRoute) {
    return FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return  pageRoute;
              },
            ));
          },
          label:  Text(
                str,
                style:floatButtonText(),
              ));
  }