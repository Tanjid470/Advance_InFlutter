import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

 final snackbar = SnackBar(
                  action: SnackBarAction(
                      label: '', textColor: Colors.green, onPressed: () {}),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  behavior: SnackBarBehavior.floating,
                  content: const Text(
                    'Denied!!',
                    style: TextStyle(color: Colors.red),
                  ),
                  duration:const Duration(seconds: 1),
                );

  TextButton customButton(
      BuildContext context, String label, Permission contacts) {
    return TextButton(
        onPressed: () {
          checkPermision(contacts, context);
        },
        child: Container(
            height: 45,
            width: 130,
            decoration: const BoxDecoration(
             gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromARGB(255, 10, 189, 78), Color.fromARGB(255, 9, 201, 15)],
              ),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(child: Text(label, style: textButton2()))));
  }

  Future<void> checkPermision(
      Permission cameraPermission, BuildContext context) async {
    final status = await cameraPermission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Access Granted"),duration: Duration(milliseconds: 10),));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar);
    }
  }
