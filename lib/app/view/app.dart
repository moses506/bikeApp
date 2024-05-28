// ignore: implementation_imports
import 'package:app_repo/src/app_repo.dart';
import 'package:bicycle_app/app/theme/theme_cubit.dart';
import 'package:bicycle_app/app/view/color_schemes.g.dart';
import 'package:bicycle_app/auth/auth_bloc.dart';

import 'package:bicycle_app/l10n/l10n.dart';
import 'package:bicycle_app/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class App extends StatelessWidget {
  const App(this.repo, {super.key});

  final AppRepo repo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(repo)),
          BlocProvider(create: (context) => ThemeCubit(repo)),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        themeMode: context.watch<ThemeCubit>().state.mode,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LoginPage(),
      ),
    );
  }
}

// class App extends StatelessWidget {
//   const App(AppRepo appRepo, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         ),
//         useMaterial3: true,
//       ),
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       home: const CounterPage(),
//     );
//   }
// }
