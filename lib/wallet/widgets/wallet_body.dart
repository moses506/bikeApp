import 'package:bicycle_app/wallet/widgets/add_funds.dart';
import 'package:flutter/material.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key,  this.money});
  final int? money;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: [
          Container(
            height: 100,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Available balance'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ZMW ${money??0.0}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const AddFunds(),
                        ),
                      );
                    },
                    child: const Text('Add Money '),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recent transactions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Paid for ride'),
                        subtitle: const Text('6 May 2024, 5:50 pm'),
                        trailing: const Text(
                          'ZMW 50.00',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 20,
                          child: Image.asset(
                            'assets/bike.png',
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fit: BoxFit.fill,
                            height: 25,
                          ),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Security deposited'),
                        subtitle: const Text('8 May 2024, 5:50 pm'),
                        trailing: const Text(
                          'ZMW 50.00',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 20,
                          child: Image.asset(
                            'assets/padlock.png',
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fit: BoxFit.fill,
                            height: 25,
                          ),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Paid for ride'),
                        subtitle: const Text('6 May 2024, 5:50 pm'),
                        trailing: const Text(
                          'ZMW 50.00',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 20,
                          child: Image.asset(
                            'assets/bike.png',
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fit: BoxFit.fill,
                            height: 25,
                          ),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Security deposited'),
                        subtitle: const Text('6 May 2024, 5:50 pm'),
                        trailing: const Text(
                          'ZMW 50.00',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 20,
                          child: Image.asset(
                            'assets/padlock.png',
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fit: BoxFit.fill,
                            height: 25,
                          ),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Paid for ride'),
                        subtitle: const Text('6 May 2024, 5:50 pm'),
                        trailing: const Text(
                          'ZMW 50.00',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 20,
                          child: Image.asset(
                            'assets/bike.png',
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fit: BoxFit.fill,
                            height: 25,
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
