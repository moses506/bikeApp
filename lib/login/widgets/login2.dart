// import 'package:shimzlaw_app/admin/dashboard/home%20/admin_home.dart';

// import 'package:shimzlaw_app/admin_home%20/view/admin_home_page.dart';

import 'package:bicycle_app/home/cubit/cubit.dart';
import 'package:bicycle_app/login/cubit/login_cubit.dart';
import 'package:bicycle_app/widgets/app_loader.dart';
import 'package:bicycle_app/widgets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}

class Login2Body extends StatefulWidget {
  /// {@macro login_body}

  const Login2Body({super.key});

  @override
  State<Login2Body> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<Login2Body> {
  final formKey = GlobalKey<FormState>();

  final _username = TextEditingController();

  final _password = TextEditingController();

  bool _obscured = true;
  String getGreetingMessage() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 12) {
      return 'Good Morning, Welcome!';
    } else if (hour < 17) {
      return 'Good Afternoon, Welcome back!';
    } else {
      return 'Good Evening, Welcome back!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        //

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
          // backgroundColor: Color(0xffF1F1F1),
          body: Container(
            decoration:  const BoxDecoration(
              color: Color(0xff232323),
              image: DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/100582/pexels-photo-100582.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
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
                        AppIcons.banner,
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
                                'assets/PeddleShare-2-removebg-preview.png',
                                // AppIcons.logoOnGreen,
                                width: 110,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                getGreetingMessage(),
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
                      vertical: 50,
                      horizontal: 16,
                    ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    Center(
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),

                                        // textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Please provide your login credentials',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      controller: _username,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        hintText: 'Username',
                                        hintStyle:
                                            TextStyle(color: Colors.white),
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                      controller: _password,
                                      obscureText: _obscured,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Password',
                                        hintStyle: const TextStyle(
                                            color: Colors.white,),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            showBottomSheet(
                                              context: context,
                                              builder: (_) {
                                                return const SizedBox(
                                                  height: 500,
                                                  // child: 
                                                  //const ConfirmEmail(),
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Forgot your password?',
                                            style: GoogleFonts.inter(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ),
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
                                        if (formKey.currentState?.validate() ??
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
                            const Text(
                              "You don't have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigator.push(context,
                                // RegisterPage.route());
                              },
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
