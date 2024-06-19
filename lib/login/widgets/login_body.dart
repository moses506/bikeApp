import 'package:bicycle_app/home/home.dart';
import 'package:bicycle_app/login/cubit/cubit.dart';
import 'package:bicycle_app/login/widgets/register.dart';
import 'package:bicycle_app/widgets/app_loader.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _username = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final _password = TextEditingController();

  bool _obscured = true;
  @override
  void initState() {
    super.initState();
    _username.addListener(_validatePhoneNumber);
  }

  @override
  void dispose() {
    _username
      ..removeListener(_validatePhoneNumber)
      ..dispose();
    super.dispose();
  }

  void _validatePhoneNumber() {
    setState(() {});
  }

  Future<void> _openCountryPickerDialog() async {
    final country = await showDialog<Country>(
      context: context,
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Theme.of(context).colorScheme.tertiary,
        ),
        child: CountryPickerDialog(
          onValuePicked: (Country country) {
            setState(() {});
          },
          isSearchable: true,
          itemBuilder: (Country country) => Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              const SizedBox(width: 8),
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
      setState(() {});
    }
  }

  bool get isPhoneNumberValid {
    final phoneNumber = _username.text;
    return phoneNumber.length == 9 && RegExp(r'^\d{9}$').hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushAndRemoveUntil(context, HomePage.route(), (_) => false);
        } else if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Form(
            key: formKey,
            child: ListView(
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
                    'Welcome back, please login to your account',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Mobile Number',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                // Card(
                //   elevation: 5,
                //   child: Padding(
                //     padding: const EdgeInsets.all(8),
                //     child: TextFormField(
                //       style: const TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 15,
                //       ),
                //       keyboardType: TextInputType.phone,
                //       controller: _username,
                //       decoration: InputDecoration(
                //         prefix: GestureDetector(
                //           onTap: _openCountryPickerDialog,
                //           child: DecoratedBox(
                //             decoration: BoxDecoration(
                //               border: Border(
                //                 bottom: BorderSide(
                //                   color: Theme.of(context)
                //                       .colorScheme
                //                       .surfaceContainerHighest,
                //                   width: 1.2,
                //                 ),
                //               ),
                //             ),
                //             child: Row(
                //               mainAxisSize: MainAxisSize.min,
                //               children: [
                //                 DecoratedBox(
                //                   decoration: BoxDecoration(
                //                     border: Border.all(
                //                       color: Theme.of(context)
                //                           .colorScheme
                //                           .tertiary,
                //                       width: 1.5,
                //                     ),
                //                     borderRadius: BorderRadius.circular(4),
                //                   ),
                //                   child: ClipRRect(
                //                     borderRadius: BorderRadius.circular(2),
                //                     child:
                //                         CountryPickerUtils.getDefaultFlagImage(
                //                       _selectedCountry,
                //                     ),
                //                   ),
                //                 ),
                //                 const SizedBox(width: 8),
                //                 Text(
                //                   ' +${_selectedCountry.phoneCode}',
                //                   style: const TextStyle(fontSize: 16),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //         isDense: true,
                //         hintText: '  Enter Phone Number',
                //         border: InputBorder.none,
                //       ),
                //       validator: (text) {
                //         if (text == null || text.isEmpty) {
                //           return 'Phone number is required';
                //         } else if (!isPhoneNumberValid) {
                //           return 'Phone number must be 9 digits';
                //         }
                //         return null;
                //       },
                //     ),
                //   ),
                // ),
                TextFormField(
                  maxLength: 10,
                  controller: _username,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefix: Text('26 '),
                    suffix: Icon(Icons.phone_android),
                    isDense: true,
                    hintText: 'Phone',
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return 'Phone is required';
                    }else if(text!.length< 10){
                      return 'Phone number too short';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _password,
                  obscureText: _obscured,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscured ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscured = !_obscured;
                        });
                      },
                    ),
                  ),
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return 'Password is required';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.check_box),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '''By Continuing You agree to the terms and conditions of Peddle Share''',
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text("You don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, ReisterClientPage.route());
                      },
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
                  onPressed: state.isLoading
                      ? null
                      : () {
                          context.read<LoginCubit>().login({
                            'username': '0977334400',
                            'password': 'Password@06'
                          });
                          if (formKey.currentState?.validate() ?? false) {}
                        },
                  child: state.isLoading
                      ? const Loader(
                          color: Colors.white,
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
              const  SizedBox(height: 10,),
              ],
              
            ),
          ),
        );
      },
    );
  }
}
