
import 'package:bicycle_app/Profile/widgets/Profile_body.dart';
import 'package:bicycle_app/auth/auth_bloc.dart';
import 'package:bicycle_app/profile/cubit/cubit.dart';

import 'package:flutter/material.dart';

/// {@template history_page}
/// A description for HistoryPage
/// {@endtemplate}
class ProfilePage extends StatelessWidget {
  /// {@macro history_page}
  const ProfilePage({
    super.key,
  });

  /// The static route for HistoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: '/dashbord',
        ),
        builder: (_) => const ProfilePage(),);
  }

  @override
  Widget build(BuildContext context) {
    final id = context.watch<AuthBloc>().state.user.userId;

    return BlocProvider(
      create: (context) => ProfileCubit(
        context.read(),
      )..fertchData(id),
      child: const Scaffold(
        body: ProfileView(),
      ),
    );
  }
}

/// {@template history_view}
/// Displays the Body of HistoryView
/// {@endtemplate}
class ProfileView extends StatelessWidget {
  /// {@macro history_view}
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileBody();
  }
}
