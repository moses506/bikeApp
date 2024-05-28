// import 'package:shimzlaw_app/admin/dashboard/home%20/admin_home.dart';

// import 'package:shimzlaw_app/admin_home%20/view/admin_home_page.dart';

import 'dart:developer';

import 'package:bicycle_app/home/cubit/cubit.dart';
import 'package:bicycle_app/home/view/home_page.dart';
import 'package:bicycle_app/login/cubit/login_cubit.dart';
import 'package:bicycle_app/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../widgets/icons.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}

class LoginBody2 extends StatefulWidget {
  /// {@macro login_body}

  const LoginBody2({super.key});

  @override
  State<LoginBody2> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody2> {
  final formKey = GlobalKey<FormState>();

  final _username = TextEditingController();

  final _password = TextEditingController();

  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.push(context, HomePage.route());
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state.status == LoginStatus.error) {
         
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        // if (state.status == LoginStatus.success) {
        //   if (state.role == 'CLIENT') {
        //   } else if (state.role == 'ADMIN_INITIATOR') {
        //     if (state.autoPass == 'Y') {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => ResetPage(userName: state.email),
        //           ));
        //     } else if (state.autoPass == 'N') {
        //       Navigator.pushAndRemoveUntil(
        //           context, AdminHomePage.route(), (route) => false);
        //     }
        //   }
        // } else if (state.status == LoginStatus.success) {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text(state.message)));

        //   // if (state.role == 'CLIENT') {
        // } else if (state.status == LoginStatus.error) {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text(state.message)));
        // }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xffF1F1F1),
          body: Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff232323),
                image: DecorationImage(
                  image: AssetImage('assets/Shimzlaw-background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/shimzlaw-banner.svg',
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                SvgPicture.asset(
                                  AppIcons.logoOnGreen,
                                  width: 110,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Good morning welcome',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 16),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff0A3418).withOpacity(0.5),
                                const Color(0xff0A3418).withOpacity(0.7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Center(
                                        child: Text('Login',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)

                                            // textAlign: TextAlign.center,

                                            ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Please provide your login credentials',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(height: 30),
                                      TextFormField(
                                        controller: _username,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          hintText: 'Username',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (text) {
                                          if (text?.isEmpty ?? false) {
                                            return 'Username is required';
                                          }

                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 16),
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
                                              _obscured
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
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
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              showBottomSheet(
                                                context: context,
                                                builder: (_) {
                                                  return SizedBox(
                                                    height: 500,
                                                    // child: const ConfirmEmail(),
                                                  );
                                                },
                                              );
                                            },
                                            child: Text('Forgot your password?',
                                                style: GoogleFonts.inter(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .scrim)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                FilledButton(
                                  style: FilledButton.styleFrom(
                                    minimumSize: const Size.fromHeight(48),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.scrim,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: state.isLoading
                                      ? null
                                      : () {
                                          if (formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            context.read<LoginCubit>().login({
                                              'email': _username.text,
                                              'password': _password.text,
                                            });
                                          }
                                        },
                                  child: state.isLoading
                                      ? const Loader(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          'Login',
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("You don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  // Navigator.push(context, RegisterPage.route());
                                },
                                child: const Text('Sign Up'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
