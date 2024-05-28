import 'package:bicycle_app/auth/auth_bloc.dart';
import 'package:bicycle_app/notifications/cubit/cubit.dart';
import 'package:bicycle_app/notifications/widgets/notifications_body.dart';
import 'package:flutter/material.dart';

/// {@template history_page}
/// A description for HistoryPage
/// {@endtemplate}
class NaficationsPage extends StatelessWidget {
  /// {@macro history_page}
  const NaficationsPage({
    super.key,
  });

  /// The static route for HistoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: '/dashbord',
        ),
        builder: (_) => const NaficationsPage(),);
  }

  @override
  Widget build(BuildContext context) {
    final id = context.watch<AuthBloc>().state.user.userId;

    return BlocProvider(
      create: (context) => NotificationsCubit(
        context.read(),
      )..fertchData(id),
      child: const Scaffold(
        body: NotificationsView(),
      ),
    );
  }
}

/// {@template history_view}
/// Displays the Body of HistoryView
/// {@endtemplate}
class NotificationsView extends StatelessWidget {
  /// {@macro history_view}
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotificationsBOdy();
  }
}
