import 'package:bicycle_app/login/login.dart';
import 'package:bicycle_app/widgets/dialog_box.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              'User name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'username@gmail.com',
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit_document),
            ),
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
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
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Image.asset(
                        'assets/bicycle.png',
                        height: 35,
                      ),
                      const Text(
                        'Ride Taken',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Text(
                        '40 Rides',
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
                  Column(
                    children: [
                      Image.asset(
                        'assets/compass.png',
                        height: 35,
                      ),
                      const Text(
                        'Distance',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Text(
                        '90.54 km',
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
                  Column(
                    children: [
                      Image.asset(
                        'assets/balance-sheet.png',
                        height: 35,
                      ),
                      const Text(
                        'Acc Balance',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Text(
                        'K1,500.00',
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
            height: 15,
          ),
          ColoredBox(
            color: Colors.grey.withOpacity(0.3),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Ride history',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.asset(
                      'assets/bike.png',
                      color: Theme.of(context).colorScheme.onPrimary,
                      height: 25,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Refer and earn',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.people_outline,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Language',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.asset(
                      'assets/worldwide.png',
                      color: Theme.of(context).colorScheme.onPrimary,
                      height: 25,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'App Settings',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.settings_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'FAQ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.asset(
                      'assets/talking.png',
                      color: Theme.of(context).colorScheme.onPrimary,
                      height: 25,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.policy_outlined,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Help & Support',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.question_mark_sharp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    showAppDialog(
                      context,
                      title: 'Logout',
                      message: 'Are you sure you want to logout?',
                      onConfirm: (p0) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (context) => const LoginPage(),),
                        );
                      },
                    );
                  },
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
