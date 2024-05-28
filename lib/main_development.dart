import 'dart:io';

import 'package:app_repo/app_repo.dart';
import 'package:bicycle_app/app/view/app.dart';
import 'package:bicycle_app/bootstrap.dart';
import 'package:bicycle_app/config.dart';
import 'package:flutter/widgets.dart';



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() async => App(await AppRepo.init(config: 
        kDevConfig,
      ),),);
  HttpOverrides.global = MyHttpOverrides();
}
