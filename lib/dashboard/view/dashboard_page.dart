import 'package:bicycle_app/auth/auth_bloc.dart';
import 'package:bicycle_app/dashboard/cubit/dashboard_cubit.dart';
import 'package:bicycle_app/dashboard/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template history_page}
/// A description for HistoryPage
/// {@endtemplate}
class DashBoardPage extends StatelessWidget {
  /// {@macro history_page}
  const DashBoardPage({
    super.key,
  });

  /// The static route for HistoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: '/dashbord',
        ),
        builder: (_) => const DashBoardPage(),);
  }

  @override
  Widget build(BuildContext context) {
    final id = context.watch<AuthBloc>().state.user.userId;

    return BlocProvider(
      create: (context) => DashoardCubit(
        context.read(),
      )..fertchData(id),
      child: const Scaffold(
        body: DashoardView(),
      ),
    );
  }
}

/// {@template history_view}
/// Displays the Body of HistoryView
/// {@endtemplate}
class DashoardView extends StatelessWidget {
  /// {@macro history_view}
  const DashoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MapBody();
  }
}
