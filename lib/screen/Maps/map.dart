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
  String currentAddress = "invisible";
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/previews/001/265/731/original/map-with-location-pin-vector.jpg"),
                        fit: BoxFit.fitWidth)),
              ),
              Card(
                color: const Color.fromARGB(255, 93, 115, 245),
                child: ListTile(
                  title: Text(
                    "Latitude ",
                    style: textButton2(),
                  ),
                  subtitle: Text(
                    "${currentPosition?.latitude}",
                    style: textButton(),
                  ),
                  // Text(
                  //   "Latitude ${currentPosition?.latitude}  ",
                  //   style: textButton(),
                  // ),
                ),
              ),
              Card(
                color: const Color.fromARGB(255, 93, 115, 245),
                child: ListTile(
                  title: Text(
                    "Longitude ",
                    style: textButton2(),
                  ),
                  subtitle: Text(
                    "${currentPosition?.longitude}",
                    style: textButton(),
                  ),
                  // Text(
                  //   "Latitude ${currentPosition?.latitude}  ",
                  //   style: textButton(),
                  // ),
                ),
              ),
              Card(
                color: const Color.fromARGB(255, 93, 115, 245),
                child: ListTile(
                  title: Text(
                    "Current Address ",
                    style: textButton2(),
                  ),
                  subtitle: Text(
                    "${currentAddress}",
                    style: textButton(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  currentPosition = await determinePosition();
                  await getAddress();
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 93, 115, 245),
                             Color.fromARGB(255, 11, 136, 11),
                            Color.fromARGB(255, 62, 202, 62),
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      Text(
                        'Location',
                        style: textStyleCenter(),
                      ),
                    ],
                  )),
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
