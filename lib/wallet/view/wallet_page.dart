import 'package:bicycle_app/auth/auth_bloc.dart';
import 'package:bicycle_app/wallet/cubit/cubit.dart';
import 'package:bicycle_app/wallet/widgets/wallet_body.dart';
import 'package:flutter/material.dart';

/// {@template history_page}
/// A description for HistoryPage
/// {@endtemplate}
class WalletPage extends StatelessWidget {
  /// {@macro history_page}
  const WalletPage({
    super.key,
  });

  /// The static route for HistoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: '/dashbord',
        ),
        builder: (_) => const WalletPage(),);
  }

  @override
  Widget build(BuildContext context) {
    final id = context.watch<AuthBloc>().state.user.userId;

    return BlocProvider(
      create: (context) => WalletCubit(
        context.read(),
      )..fertchData(id),
      child: const Scaffold(
        body: WalletView(),
      ),
    );
  }
}

/// {@template history_view}
/// Displays the Body of HistoryView
/// {@endtemplate}
class WalletView extends StatelessWidget {
  /// {@macro history_view}
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WalletBody();
  }
}
