import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:flutter/material.dart';

TextButton mapStyleButtom(String s, void Function() workMethod, bool status) {
    return TextButton(
                      onPressed: () {
                        workMethod();
                        status = !status;
                      },
                      style: ButtonStyle(
                         minimumSize: MaterialStateProperty.all(Size(20.0, 35.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0), // Adjust the border radius as needed
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          !status
                              ?const Color.fromARGB(255, 74, 169, 247)
                              : const Color.fromARGB(255, 202, 199, 199), // Change colors as needed
                        ),
                      ),
                      child: Text(
                        s,
                        style:googleMapButton(),
                      ));
  }
  
 