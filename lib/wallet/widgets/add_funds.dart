import 'package:bicycle_app/wallet/widgets/card.dart';
import 'package:flutter/material.dart';

class AddFunds extends StatelessWidget {
  const AddFunds({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add money'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Amount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17,),
                    keyboardType: TextInputType.number,
                    controller: controller,
                    decoration: const InputDecoration(
                      prefix: Text('ZMW '),
                      hintText: 'Amount',
                      border: InputBorder.none,
                    ),
                    validator: (text) {
                      if (text?.isEmpty ?? false) {
                        return 'Amount is required';
                      }

                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Proceed'),
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (J) => CreditCardExample(
                          money: int.parse(controller.text),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
