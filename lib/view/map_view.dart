// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class MapScreen extends StatefulWidget {
// //   const MapScreen({super.key, 
// //   //required this.interposition
// //   });
// // //final LatLng interposition;
// //   @override
// //   State<MapScreen> createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //    late GoogleMapController mapController;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: GoogleMap(
// //         onMapCreated: (controller) {
// //           setState(() {
// //             mapController = controller;
// //           });
// //         },
// //         initialCameraPosition: CameraPosition(target: LatLng(37.7749, -122.4194),
// //         zoom: 14.0
// //     ),myLocationButtonEnabled: true,
// //     ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlng/latlng.dart';

// class MapScreen extends StatelessWidget {
//   final double latitude;
//   final double longitude;

//   MapScreen({required this.latitude, required this.longitude});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Map'),
//       ),
//       body: FlutterMap(
//         options: MapOptions(
//           center: LatLng(latitude, longitude),
//           zoom: 15.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayerOptions(
//             markers: [
//               Marker(
//                 width: 40.0,
//                 height: 40.0,
//                 point: LatLng(latitude, longitude),
//                 builder: (ctx) => Container(
//                   child: Icon(Icons.location_on, color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//         ], children: [],
//       ),
//     );
//   }
// }