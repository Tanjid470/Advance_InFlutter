import 'package:advance_in_flutter/constants/app_bar.dart';
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
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                center:LatLng(23.804100,  90.415200),
                zoom: 7,
                minZoom: 4,
                maxZoom: 15),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
