import 'package:bicycle_app/home/widgets/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SearchPlace extends StatefulWidget {
  const SearchPlace({super.key});

  @override
  SearchPlaceState createState() => SearchPlaceState();
}

class SearchPlaceState extends State<SearchPlace> {
  final TextEditingController _controller = TextEditingController();
  bool _isBooking = false;

  Future<void> _initiateFakeBooking() async {
    setState(() {
      _isBooking = true;
    });

    // Simulate a delay to mimic booking process
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isBooking = false;
    });

    // Show a success message or navigate to a new screen after booking
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Booking initiated!'),
      ),
    );
    await Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (context) => const QRScanner(
            // startPoint:LatLng(37.7749, -122.4194),
            // endPoint: LatLng(34.0522, -118.2437),
            ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        '''Location permissions are permanently denied, we cannot request permissions.''',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();

    // Get the address from the coordinates
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placemarks[0];
    final address = '${place.locality}, ${place.street}';

    // Print the address to the console

    setState(() {
      _controller.text = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Column(
          children: [
            Card(
              elevation: 5,
              color: Colors.grey.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'From?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              color: Colors.grey.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Where to?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Card(
              color: Colors.grey.withOpacity(0.1),
              child: ListTile(
                leading: Image.asset(
                  'assets/target.png',
                  color: Colors.blueAccent,
                  height: 20,
                ),
                title: const Text('Use Current Location'),
                onTap: _getCurrentLocation,
              ),
            ),
            const Text(
              'Recent Searched',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const ListTile(
              title: Text('Maindahill'),
              leading: Icon(Icons.replay_outlined),
            ),
            const ListTile(
              title: Text('ZCCMHI'),
              leading: Icon(Icons.replay_outlined),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: _isBooking ? null : _initiateFakeBooking,
              child: _isBooking
                  ? const CircularProgressIndicator() // Show loading indicator
                  : const Text(
                      'Proceed',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SearchPlace(),
  ),);
}
