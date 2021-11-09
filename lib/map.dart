// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MapsPage extends StatefulWidget {
//   @override
//   _MapsPageState createState() => _MapsPageState();
// }

// class _MapsPageState extends State<MapsPage> {
//   late Position userLocation;
//   late GoogleMapController mapController;
//   void _launchMapsUrl(double lat, double lon) async {
//     final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   Future<Position> _getLocation() async {
//     try {
//       userLocation = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best);
//     } catch (e) {
//       userLocation = null;
//     }
//     return userLocation;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Google Maps'),
//       ),
//       body: FutureBuilder(
//         future: _getLocation(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             return GoogleMap(
//               mapType: MapType.normal,
//               onMapCreated: _onMapCreated,
//               myLocationEnabled: true,
//               initialCameraPosition: CameraPosition(
//                   target: LatLng(userLocation.latitude, userLocation.longitude),
//                   zoom: 15),
//             );
//           } else {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   CircularProgressIndicator(),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           mapController.animateCamera(CameraUpdate.newLatLngZoom(
//               LatLng(userLocation.latitude, userLocation.longitude), 18));
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 content: Text(
//                     'Your location has been send !\nlat: ${userLocation.latitude} long: ${userLocation.longitude} '),
//               );
//             },
//           );
//         },
//         label: Text("Send Location"),
//         icon: Icon(Icons.near_me),
//       ),
//     );
//   }
// }
