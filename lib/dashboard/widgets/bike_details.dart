import 'package:bicycle_app/dashboard/widgets/search_place.dart';
import 'package:flutter/material.dart';

class BikeDetails extends StatelessWidget {
  const BikeDetails({required this.image, super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
        title: const ListTile(
          title: Text(
            'Mountain BK2254',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Ready to go '),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/renewable-energy.png',
                          height: 26,
                        ),
                        const Text(
                          'Range upto',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const Text(
                          '35-40 km',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              // loremIpsum(words: 30),
              '''Experience the ultimate ride with our state-of-the-art urban bicycle, designed for both comfort and efficiency. This sleek bike features a lightweight aluminum frame, making it easy to maneuver through city streets and park paths. Equipped with a 21-speed Shimano gear system, you can effortlessly switch gears to tackle any terrain, whether you're climbing hills or cruising on flat surfaces. The bike also boasts puncture-resistant tires and a front suspension fork to ensure a smooth ride even on rough roads. For added convenience and safety, it includes front and rear LED lights, a bell, and a sturdy lock.''',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Rent',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Spacer(),
                  const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Fixed rent',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'k30',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  const Spacer(),
                  Container(
                    height: 100,
                    width: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'per km',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'k0.50',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    width: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Paulse/min',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'k0.10',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Parking rules',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ColoredBox(
            color: Colors.grey.withOpacity(0.3),
            child: Column(
              children: [
                ListTile(
                  title: const Text('Park in peddle rider Zones only '),
                  leading: Image.asset(
                    'assets/parking-area.png',
                    height: 30,
                  ),
                ),
                ListTile(
                  title: const Text('Do not park in private area'),
                  leading: Image.asset(
                    'assets/no-parking.png',
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<dynamic>(builder: (J)=>const SearchPlace()));
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(10),),
                child: const Center(
                    child: Text(
                  'Unlock Now',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),),
              ),
            ),
              Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10),),
              child: const Center(
                  child: Text(
                'Directions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
