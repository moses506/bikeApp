// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatelessWidget {
//   final LatLng startPoint;
//   final LatLng endPoint;

//   const MapScreen({
//     required this.startPoint,
//     required this.endPoint,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var markers = <Marker>{
//       Marker(
//         markerId: MarkerId('startPoint'),
//         position: startPoint,
//       ),
//       Marker(
//         markerId: MarkerId('endPoint'),
//         position: endPoint,
//       ),
//     };

//     var polylines = <Polyline>{
//       Polyline(
//         polylineId: PolylineId('line'),
//         points: [startPoint, endPoint],
//         color: Colors.blue,
//         width: 5,
//       ),
//     };

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your current trip'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(target: startPoint, zoom: 6),
//         markers: markers,
//         polylines: polylines,
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: MapScreen(
    
//       startPoint: LatLng(28.28619003953091,-15.41407929850562), 
//       endPoint: LatLng(28.3053177921208,-15.414812162672844),  
//     ),
//   ));
// }
