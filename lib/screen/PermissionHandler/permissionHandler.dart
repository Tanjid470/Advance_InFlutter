import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/constants/app_colors.dart';
import 'package:advance_in_flutter/constants/app_custom.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler extends StatefulWidget {
  const PermissionHandler({super.key});

  @override
  State<PermissionHandler> createState() => _PermissionHandlerState();
}

class _PermissionHandlerState extends State<PermissionHandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("Permission Handler"),
      body: Container(
        color: AppColors.bgcolor,
        width: MediaQuery.of(context).size.width,
        child: Column(
      
          children: [
           Container(
                height: 250,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://st2.depositphotos.com/3079665/10216/v/600/depositphotos_102167632-stock-illustration-smiling-businessman-holding-right-and.jpg"),
                        fit: BoxFit.fill)),
              ),
            customButton(context, "Camera", Permission.camera),
            customButton(context, "Location", Permission.location),
            customButton(context, "Storage", Permission.storage),
            customButton(context, "Read Contact", Permission.contacts),
            ElevatedButton(
              onPressed: () async {
                // Request location permission
                final status = await Permission.location.request();
                if (status == PermissionStatus.granted) {
                  // Get the current location
                  final position = await Geolocator.getCurrentPosition();
                  print(
                      'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
                } else {
                  // Permission denied
                  print('Location permission denied.');
                }
              },
              child: const Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
