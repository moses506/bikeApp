import 'dart:math';

import 'package:bicycle_app/login/cubit/cubit.dart';
import 'package:bicycle_app/widgets/app_loader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReisterClientPage extends StatelessWidget {
  /// {@macro login_page}

  const ReisterClientPage({super.key});

  /// The static route for ReisterClientPage

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const ReisterClientPage(),);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read()),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: RegisterClient(),
      ),
    );
  }
}

class RegisterClient extends StatefulWidget {
  const RegisterClient({super.key});

  @override
  State<RegisterClient> createState() => _RegisterClientState();
}

class _RegisterClientState extends State<RegisterClient> {
  final firstName = TextEditingController();
  final lastNmae = TextEditingController();
 
  final _otherName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
bool _obscured = true;
  final formKey = GlobalKey<FormState>();
  final statements = <String>['Male', 'female'];
String selectedItem = 'Male';
final idTypes = <String>['NRC', 'Passport', 'Others'];
String selectedType = 'NRC';
final idNo= TextEditingController();
 var _nrcLength = 0;
   String addCharAtPosition(String text, String char, int position) {
    return text.substring(0, position) + char + text.substring(position);
  }
   String _selectedPdfPath = ''; // Store the selected PDF file path.

  Future<void> _pickPdf() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setState(() {
          _selectedPdfPath = result.files.single.path!;
        });
      }
    } catch (e) {
      print('Error picking PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Register client'),
          ),
          body: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                TextFormField(
                  style: const TextStyle(),
                  controller: firstName,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'FirstName',
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return 'FirstName is required';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                   TextFormField(
                  style: const TextStyle(),
                  controller: lastNmae,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'lastName',
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return 'lastName is required';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10,),   TextFormField(
                  style: const TextStyle(),
                  controller:_otherName,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'OtherName',
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                 
                ),
                const SizedBox(height: 10,),   TextFormField(
                  style: const TextStyle(),
                  controller: _email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'Email',
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return 'Email is required';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                  controller: _phone,
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
                    }else if(text!.length < 10){
                      return 'Phone number too short';
                    }

                    return null;
                  },
                ),
                    const SizedBox(height: 10,),
                 TextFormField(
                    
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
                ),                const SizedBox(height: 10,),
DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Select Gender',
                            ),
                            validator: (val) {
                              if (val == null) {
                                return 'Please select a Gender';
                              }
                              return null;
                            },
                            value: selectedItem,
                            items: statements.map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedItem = newValue!;
                              });
                            },
                          ),
                          const SizedBox(height: 10,),
                            
                           DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Select id type',
                            ),
                            validator: (val) {
                              if (val == null) {
                                return 'Please select id Type';
                              }
                              return null;
                            },
                            value: selectedType,
                            items: idTypes.map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedType = newValue!;
                              });
                            },
                          ),
                          const SizedBox(height: 10),

                           TextFormField(
                        controller: idNo,
                        keyboardType: selectedType == 'NRC'
                            ? TextInputType.number
                            : TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: selectedType == 'NRC'
                            ? [FilteringTextInputFormatter.digitsOnly]
                            : null,
                        // decoration: kInputDecoration.copyWith(
                        //   labelText: _selectedType == 'NRC'
                        //       ? 'NRC Number'
                        //       : 'Passport Number',
                        // ),
                         decoration:  InputDecoration(
                                isDense: true,
                                 labelText: selectedType == 'NRC'
                              ? 'NRC Number'
                              : 'Passport Number',
                                border: const OutlineInputBorder(),
                              ),
                        validator: (text) {
                          if (text?.isEmpty ?? true) {
                            return 'Form of ID is required';
                          } else if ((text?.length ?? 0) != 11 &&
                              selectedType == 'NRC') {
                            return 'Invalid NRC number';
                          }
                          return null;
                        },
                        onChanged: selectedType == 'NRC'
                            ? (String value) {
                                var valueLength =
                                    value.replaceAll('/', '').length;
                                var formatted = value
                                    .replaceAll('/', '')
                                    .substring(0, min(valueLength, 9));
                                valueLength = formatted.length;
                                if (valueLength > 5 &&
                                    (_nrcLength < valueLength ||
                                        valueLength > 6)) {
                                  formatted =
                                      addCharAtPosition(formatted, '/', 6);
                                }
                                if (valueLength > 7 &&
                                    (_nrcLength < valueLength ||
                                        valueLength == 9)) {
                                  formatted =
                                      addCharAtPosition(formatted, '/', 9);
                                }
                                idNo.value = TextEditingValue(
                                  text: formatted,
                                  selection: TextSelection.collapsed(
                                    offset: formatted.length,
                                  ),
                                );
                                _nrcLength = valueLength;
                              }
                            : null,
                      ),
                          const SizedBox(height: 10),
                          TextField(
                            controller:
                                TextEditingController(text: _selectedPdfPath),
                            readOnly: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Selct document',
                              suffixIcon: _selectedPdfPath.isEmpty
                                  ? IconButton(
                                      onPressed: _pickPdf,
                                      icon: const Icon(Icons.folder_open),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _selectedPdfPath = '';
                                        });
                                      },
                                      icon: const Icon(Icons.close),),
                            ),
                          ),
                       const SizedBox(height: 10,),
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
                        final da= <String, dynamic>{
                          'password':_password.text,
                          'emailAddress':_email.text,
                          'firstName':firstName.text,
                          'gender':selectedItem,
                          'lastName':lastNmae.text,
                          'meansOfIdentificationNumber':idNo.text,
                          'meansOfIdentificationType':selectedType,
                          'mobileNumber':_phone.text,
                          'otherName':_otherName.text,
                          'files':_selectedPdfPath,

                        };
                          print(da);
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<LoginCubit>().register(da);
                          }
                        },
                  child: state.isLoading
                      ? const Loader(
                          color: Colors.white,
                        )
                      : const Text(
                          'Register ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
                       const SizedBox(height: 10,),


              ],
            ),
          ),
        );
      },
    );
  }
}
