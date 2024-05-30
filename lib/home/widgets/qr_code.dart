import 'dart:developer';

import 'package:bicycle_app/home/widgets/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:slide_to_act/slide_to_act.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  QRScannerState createState() => QRScannerState();
}

class QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  final TextEditingController _controller = TextEditingController();
  bool isFlashOn = false;
  bool isLoading = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _controller.text = scanData.code!;
      });
    });
  }

  Future<void> _toggleFlash() async {
    try {
      if (controller != null) {
        await controller!.toggleFlash();
        final currentFlashState = await controller!.getFlashStatus();
        setState(() {
          isFlashOn = currentFlashState ?? false;
        });
      }
    } catch (e) {
      log('error$e');
    }
  }

  Future<void> _initiateBooking(String code) async {
    setState(() {
      isLoading = true;
    });

    // Here, you can implement the booking logic with the given code

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Booking initiated with code: $code')),
    );

    // For demonstration, simulate a delay and navigate to MapScreen
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
    await Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (context) => const MapScreen(
          // startPoint: LatLng(28.28619003953091, -15.41407929850562),
          //   endPoint: LatLng(37.42496133580664, -122.081749655962),

          startPoint: LatLng(-15.41407929850562, 28.28619003953091),
          endPoint: LatLng(-15.406042092113882, 28.4319844916573),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code or Enter Code'),
        actions: [
          IconButton(
            icon: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
            onPressed: _toggleFlash,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Enter Code',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                       style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      
                      onPressed: isLoading
                          ? null
                          : () => _initiateBooking(_controller.text),
                      child: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Continue to book',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}



class MapScreen extends StatelessWidget {
  const MapScreen({required this.startPoint, required this.endPoint, Key? key}) : super(key: key);
  final LatLng startPoint;
  final LatLng endPoint;

  @override
  Widget build(BuildContext context) {
    final markers = <Marker>{
      Marker(markerId: const MarkerId('startPoint'), position: startPoint),
      Marker(markerId: const MarkerId('endPoint'), position: endPoint),
    };

    final route = <LatLng>[
      startPoint,
      const LatLng(-15.41407929850562, 28.28619003953091),
      endPoint,
    ];

    final routePolyline = Polyline(
      polylineId: const PolylineId('route'),
      points: route,
      color: Colors.blue,
      width: 5,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Trip'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: startPoint, zoom: 12),
            markers: markers,
            polylines: {routePolyline},
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: SlideAction(
              text: 'Slide to Complete Trip',
              onSubmit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => TripDetailsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// class MapScreen extends StatelessWidget {
//   const MapScreen(
//       {required this.startPoint, required this.endPoint, super.key});
//   final LatLng startPoint;
//   final LatLng endPoint;

//   @override
//   Widget build(BuildContext context) {
//     final markers = <Marker>{
//       Marker(markerId: const MarkerId('startPoint'), position: startPoint),
//       Marker(markerId: const MarkerId('endPoint'), position: endPoint),
//     };

//     // Define the route as a list of LatLng points
//     final route = <LatLng>[
//       startPoint,
//       const LatLng(-15.41407929850562, 28.28619003953091), // Intermediate point (example)
//       endPoint,
//     ];

//     final routePolyline = Polyline(
//       polylineId: const PolylineId('route'),
//       points: route,
//       color: Colors.blue,
//       width: 5,
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Current Trip'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(target: startPoint, zoom: 12),
//         markers: markers,
//         polylines: {routePolyline},
//       ),
//     );
//   }
// }
