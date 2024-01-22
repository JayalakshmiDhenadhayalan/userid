import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, 
  //required this.interposition
  });
//final LatLng interposition;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
   late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(target: LatLng(37.7749, -122.4194),
        zoom: 14.0
    ),myLocationButtonEnabled: true,
    ),
    );
  }
}