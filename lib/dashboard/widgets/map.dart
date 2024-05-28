import 'dart:async';

import 'package:bicycle_app/dashboard/cubit/dashboard_cubit.dart';
import 'package:bicycle_app/dashboard/widgets/bike_details.dart';
import 'package:bicycle_app/dashboard/widgets/search_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBody extends StatefulWidget {
  const MapBody({super.key});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  late GoogleMapController mapController;
  int _currentPageIndex = 0; // Track the current page index
  double longitude = -73.935242;
  double latitude = 40.730610;
  Set<Marker> markers = {}; // Set of markers
  late LatLng bikeLocation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashoardCubit, DashoardState>(
      builder: (context, state) {
        final bikes = state.places;
        final initialPosition = CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 14.4746,
        );

        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: initialPosition,
                markers: markers, // Use the set of markers here
              ),
              Positioned(
                top: 25,
                left: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (_) =>const SearchPlace(),),);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                ),
              ),
              child: CircleAvatar(
                backgroundImage: const AssetImage(
                  'assets/user-2.png',
                ),
                backgroundColor: Colors.grey,
                radius: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
                      
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            'Where do you want to go ?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            height: 20,
                            'assets/compass.png',
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            // Implement search functionality here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: bikes.length,
                    itemBuilder: (context, index) {
                      final bike = bikes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (_) => BikeDetails(
                                image: bike.image,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                        ), // Adjust the radius as needed
                                        child: Image.network(
                                          bike.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mountain bike',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Church Road..',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.timer_outlined),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '20 min/ 3.5km',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '10 bikes',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 0,
                                thickness: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Expanded(
                                    child: ListTile(
                                      title: Text(
                                        'Good',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.green,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        'Condition',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.green,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // const Expanded(
                                  //   child: ListTile(
                                  //     title: Text(
                                  //       'Ran',
                                  //       overflow: TextOverflow.clip,
                                  //     ),
                                  //     subtitle: Text('30-35'),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                        shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // await _getCurrentLocation();
                                        // _calculateAndShowRoute();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (_) => BikeDetails(
                                              image: bike.image,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Details'),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (_) => const SearchPlace(),
                                          ),
                                        );
                                      },
                                      child: Card(
                                       
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: SizedBox(
                                            height: 20,
                                            child: Image.asset(
                                              'assets/compass.png',
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onPageChanged: (int index) {
                      // Update the current page index when user scrolls
                      setState(() {
                        _currentPageIndex = index;
                      });

                      // Print the name of the place when scrolled
                      longitude = bikes[index].longitude;
                      latitude = bikes[index].latitude;
                      bikeLocation = LatLng(latitude, longitude);
                      // Move the camera to the new place
                      _moveCameraToPlace(
                        bikes[index].latitude,
                        bikes[index].longitude,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _moveCameraToPlace(double latitude, double longitude) {
    mapController.animateCamera(
      CameraUpdate.newLatLng(LatLng(latitude, longitude)),
    );

    // Update the set of markers with the new position
    setState(() {
      markers = {
        Marker(
          markerId: const MarkerId('board_marker'),
          position: LatLng(latitude, longitude),
        ),
      };
    });
  }

  Future<void> _getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    latitude = position.latitude;
    longitude = position.longitude;
  }

  void _calculateAndShowRoute() {
    // Calculate route from bike location to current location
    // Use a routing service (e.g., Google Directions API)
    // Then draw the route on the map using polylines

    // Clear existing markers
    markers
      ..clear()

      // Add marker for current location
      ..add(
        Marker(
          markerId: const MarkerId('current_location'),
          position: LatLng(latitude, longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      )

      // Add marker for bike location
      ..add(
        Marker(
          markerId: const MarkerId('bike_location'),
          position: LatLng(latitude, longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );

    // Update the map with the new markers
    setState(() {});
  }
}
