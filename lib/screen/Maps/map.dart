import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/constants/app_colors.dart';
import 'package:advance_in_flutter/constants/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GoogleMapFree extends StatefulWidget {
  const GoogleMapFree({super.key});

  @override
  State<GoogleMapFree> createState() => GoogleMapFreeState();
}

class GoogleMapFreeState extends State<GoogleMapFree> {
  String currentAddress = "Current Address";
  Position? currentPosition;
  late bool serviceEnabled = false;
  late LocationPermission permission;

  Future<Position> determinePosition() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  getAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);
      Placemark place = placemarks[0];
      print(place);
      setState(() {
        currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      e.printError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarTitle("Google Map"),
        body: Container(
          color: AppColors.bgcolor,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
               
            children: [
              Text(
                "Latitude ${currentPosition?.latitude}  ",
                style: textButton(),
              ),
              Text("Longitude ${currentPosition?.longitude}",style: textButton(),),
              Text(currentAddress,style: textButton(),),
              GestureDetector(
                onTap: () async {
                      currentPosition = await determinePosition();
                      await getAddress();
                      print(currentPosition);
                      print("\n\n\\n\n\n\n\n\n\n\nn\\n\n\n\n\n");
                  },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width-40,
                  decoration: const BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(20))),
                child:  Center(child: Text('Find Me ',style: textStyleCenter(),)),
              ),
              )
              
              // ElevatedButton(
              //     onPressed: () async {
              //         currentPosition = await determinePosition();
              //         await getAddress();
              //         print(currentPosition);
              //         print("\n\n\\n\n\n\n\n\n\n\nn\\n\n\n\n\n");
              //     },
              //     child: Container(
              //       height: 20,
              //       width: 100,
              //       child: Text('Find Me '),
              //     ))
            ],
          ),
        ));
  }
}
