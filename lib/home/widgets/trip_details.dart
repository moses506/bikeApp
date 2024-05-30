import 'package:bicycle_app/home/view/home_page.dart';
import 'package:flutter/material.dart';

class TripDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trip Summary',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Total Amount Paid: k100.00',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              const Text(
                'Rate the Trip:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: const Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      // Implement rating functionality
                    },
                  );
                }),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Leave a Comment',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                   style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
                  onPressed: () {
                  Navigator.pushAndRemoveUntil(
                            context,
                            HomePage.route(),
                            (route) => false,
                          );
                  },
                  child: const Text('Back Home ',
                  style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,),
                  ),
                ),
              ),
            ],
          ),],
        ),
      ),
    );
  }
}
