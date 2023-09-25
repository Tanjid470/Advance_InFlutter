import 'package:advance_in_flutter/constants/app_bar.dart';

import 'package:advance_in_flutter/screen/Maps/MapType/custom/floatButton.dart';
import 'package:advance_in_flutter/screen/Maps/MapType/GoogleMap/googleMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapView extends StatefulWidget {
  const FlutterMapView({super.key});

  @override
  State<FlutterMapView> createState() => _FlutterMapViewState();
}

class _FlutterMapViewState extends State<FlutterMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle("Flutter Map"),
      floatingActionButton: floatingbutton(context, "Google Map",const GoogleMapDemo()),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                center: LatLng(23.804100, 90.415200),
                zoom: 7,
                minZoom: 7,
                maxZoom: 10),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                      point: const LatLng(23.7339, 90.3929),
                      builder: (context) => const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 41, 9, 185),
                            size: 40,
                          )),
                  Marker(
                      point: const LatLng(22.9454, 90.8342),
                      builder: (context) => const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 197, 22, 10),
                            size: 40,
                          )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
