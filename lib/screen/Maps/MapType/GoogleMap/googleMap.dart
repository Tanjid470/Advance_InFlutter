import 'dart:async';

import 'package:advance_in_flutter/constants/app_bar.dart';
import 'package:advance_in_flutter/screen/Maps/MapType/GoogleMap/componentes/topActionButton.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDemo extends StatefulWidget {
  const GoogleMapDemo({super.key});

  @override
  State<GoogleMapDemo> createState() => _GoogleMapDemoState();
}

class _GoogleMapDemoState extends State<GoogleMapDemo> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(23.804100, 90.415200);
  MapType _currentMapType = MapType.normal;
  final bool _isPressed = false;
  final bool isMarker = false;
  final Set<Marker> _markers = {};
  var latitude = TextEditingController();
  var longitude = TextEditingController();
  var currentPlace;
  var currentCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("Google Map"),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              mapType: _currentMapType,
              markers: _markers,
              initialCameraPosition: const CameraPosition(
                  target: _center,
                  zoom: 10.0,
                  bearing: 1.0,
                  tilt: BitmapDescriptor.hueRed),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mapStyleButtom(
                        "Salelite", _onMapTypeButtonPressed, _isPressed),
                    mapStyleButtom("+ Marker", _showBottomSheet, isMarker)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _addMarker(String latitude, String longitude) {
    setState(() {
      print(_markers.length);
      final newMarkerId = MarkerId('marker_${_markers.length + 1}');
      _markers.add(
        Marker(
          markerId: newMarkerId,
          position: LatLng(double.parse(latitude), double.parse(longitude)),
          infoWindow: InfoWindow(
            title: currentPlace.toString(),
            snippet: currentCity.toString(),
          ),
        ),
      );
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: latitude,
                decoration: const InputDecoration(labelText: 'latitude'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: longitude,
                decoration: const InputDecoration(labelText: 'longitude'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle the button tap event here
                  _addMarker(latitude.text, longitude.text);
                  getAddress(latitude.text, longitude.text);
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  void getAddress(String text, String text2) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          double.parse(text), double.parse(text2));

      Placemark place = placemarks[0];
      print(place);
      setState(() {
        currentPlace = "${place.name}";
        currentCity = "${place.country}";
        print(currentPlace);
        print(currentCity);
      });
    } catch (e) {
      e.printError();
    }
  }
}
