import 'package:flutter/material.dart';

class NotificationsBOdy extends StatelessWidget {
  const NotificationsBOdy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Ride ended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.red,
                      child: Image.asset(
                        'assets/bike.png',
                        fit: BoxFit.fill,
                        height: 30,
                      ),
                    ),
                    subtitle: const Text(
                      '''You successifully parked BK2564 at levy junction ''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    '2 min ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Rewards',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      maxRadius: 25,
                     backgroundColor: Colors.green,
                      child: Image.asset(
                        'assets/wallet.png',
                        fit: BoxFit.fill,
                        height: 30,
                      ),
                    ),
                    subtitle: const Text(
                      '''Your referal amaount ZMW1,000 successifully added in your wallet''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    '5 min ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Security deposit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      maxRadius: 25,
                     
                      child: Image.asset(
                        'assets/padlock.png',
                        fit: BoxFit.fill,
                        height: 30,
                      ),
                    ),
                    subtitle: const Text(
                      '''Your security deposits amount ZMW 500,00 successifully paid ''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    '15 min ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Ride ended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.red,
                      child: Image.asset(
                        'assets/bike.png',
                        fit: BoxFit.fill,
                        height: 30,
                      ),
                    ),
                    subtitle: const Text(
                      '''You successifully parked BK2564 at east park ''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    '20 min ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Ride ended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.red,
                      child: Image.asset(
                        'assets/bike.png',
                        fit: BoxFit.fill,
                        height: 30,
                      ),
                    ),
                    subtitle: const Text(
                      '''You successifully parked BK2564 at lewanika mall ''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    '30 min ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Rewards',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      maxRadius: 25,
                     backgroundColor: Colors.green,
                      child: Image.asset(
                        'assets/wallet.png',
                        fit: BoxFit.fill,
                        height: 30,
                      ),
                    ),
                    subtitle: const Text(
                      '''Your referal amaount ZMW1,000 successifully added in your wallet''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    '53 min ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Security deposit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      maxRadius: 25,
                     
                      child: Image.asset(
                        'assets/padlock.png',
                        fit: BoxFit.fill,
                        height: 30,
                      ),
                    ),
                    subtitle: const Text(
                      '''Your security deposits amount ZMW 500,00 successifully paid ''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    '1 hr ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Ride ended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.red,
                      child: Image.asset(
                        'assets/bike.png',
                        fit: BoxFit.fill,
                        height: 30,
                      ),
                    ),
                    subtitle: const Text(
                      '''You successifully parked BK2564 at levy junction ''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    '2 hrs ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
