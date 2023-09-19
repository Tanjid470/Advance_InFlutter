import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/constants/app_colors.dart';
import 'package:advance_in_flutter/constants/app_custom.dart';
import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler extends StatefulWidget {
  const PermissionHandler({super.key});

  @override
  State<PermissionHandler> createState() => _PermissionHandlerState();
}

class _PermissionHandlerState extends State<PermissionHandler> {
  var position;
  bool flag = false;
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
            customButton(
                context,
                "Camera",
                Permission.camera,
                const Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.white,
                )),
            customButton(
                context,
                "Location",
                Permission.location,
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                )),
            customButton(
                context,
                "Storage",
                Permission.storage,
                const Icon(
                  Icons.sd_storage_outlined,
                  color: Colors.white,
                )),
            customButton(
                context,
                "Contact",
                Permission.contacts,
                const Icon(
                  Icons.phone,
                  color: Colors.white,
                )),
            ElevatedButton(
              onPressed: () async {
                // Request location permission
                final status = await Permission.location.request();
                if (status == PermissionStatus.granted) {
                  // Get the current location
                  position = await Geolocator.getCurrentPosition();
                  print(
                      'Latitude: ${position.latitude}, Longitude: ${position.longitude}');

                  setState(() {
                    flag = true;
                  });
                } else {
                  // Permission denied
                  print('Location permission denied.');
                }
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal)),
              child: const Text(
                'Get Location',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            
            flag
                ? Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.indigo,
                        blurStyle: BlurStyle.inner,
                        spreadRadius: 2
                      )
                    ]
                  ),
                  margin:const  EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(60,5, 60, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Latitude  ",style: textTitle(),),
                          Text(position.latitude.toString(),style: textButton(),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Longitude  ",style: textTitle(),),
                          Text(position.longitude.toString(),style: textButton(),),
                        ],
                      ),
                    ]),
                )
                : Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.indigo,
                        blurStyle: BlurStyle.inner,
                        spreadRadius: 2
                      )
                    ]
                  ),
                  margin:const  EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(60,5, 60, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Latitude  ",style: textTitle(),),
                         Text("00.0000",style: textButton(),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Longitude  ",style: textTitle(),),
                          Text("00.0000",style: textButton(),),
                        ],
                      ),
                    ]),
                )
            // Text(position.latitude),
            // Text(position.longitude),
          ],
        ),
      ),
    );
  }
}
