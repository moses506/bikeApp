import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bicycle_app/home/home.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _username = TextEditingController();
  Country _selectedCountry = CountryPickerUtils.getCountryByIsoCode('ZM');
  bool _isLoading = false;

  Future<void> _openCountryPickerDialog() async {
    final Country? country = await showDialog<Country>(
      context: context,
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Theme.of(context).colorScheme.tertiary,
        ),
        child: CountryPickerDialog(
          onValuePicked: (Country country) {
            setState(() {
              _selectedCountry = country;
            });
          },
          isSearchable: true,
          itemBuilder: (Country country) => Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              const SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  '${country.name} (+${country.phoneCode})',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          title: const Text('Select your country'),
          itemFilter: (Country country) => [
            'ZM',
            'ZA',
            'CD',
            'MW',
            'TZ',
            'BW',
            'ZW',
            'MZ',
            'NA',
            'AO',
          ].contains(country.isoCode),
          priorityList: [
            CountryPickerUtils.getCountryByIsoCode('ZM'),
            CountryPickerUtils.getCountryByIsoCode('ZA'),
          ],
        ),
      ),
    );

    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
        children: [
          Image.asset(
            'assets/PeddleShare-2-removebg-preview.png',
            height: 250,
            width: 10,
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Ride with Peddle Share',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Welcome back, please login your account',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Mobile Number',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                keyboardType: TextInputType.phone,
                controller: _username,
                decoration: InputDecoration(
                  prefix: GestureDetector(
                    onTap: _openCountryPickerDialog,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            width: 1.2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.tertiary,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: CountryPickerUtils.getDefaultFlagImage(
                                _selectedCountry,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            ' +${_selectedCountry.phoneCode}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isDense: true,
                  hintText: '  Enter Phone Number',
                  border: InputBorder.none,
                ),
                validator: (text) {
                  if (text?.isEmpty ?? false) {
                    return 'Phone number is required';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.check_box),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'By Continuing You agree the terms and conditions of the Pedle Ride',
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('You don\'t have an account? '),
              TextButton(
                onPressed: () {},
                child: const Text('Register'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: _isLoading
                ? null
                : () {
                    setState(() {
                      _isLoading = true;
                    });
                    // Simulate login process with delay
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        _isLoading = false;
                      });
                      // Show login success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login Successful!'),
                        ),
                      );
                      // Navigate to the home page
                      Navigator.pushAndRemoveUntil(
                        context,
                        HomePage.route(),
                        (route) => false,
                      );
                    });
                  },
            child: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                      strokeWidth: 2,
                    ),
                  )
                : const Text('Login', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 17),),
          ),
        ],
      ),
    );
  }
}
