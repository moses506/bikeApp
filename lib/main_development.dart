import 'dart:io';

import 'package:app_repo/app_repo.dart';
import 'package:bicycle_app/app/view/app.dart';
import 'package:bicycle_app/bootstrap.dart';
import 'package:bicycle_app/config.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  await bootstrap(
    () async => App(
      await AppRepo.init(
        config: kDevConfig,
      ),
    ),
  );
  HttpOverrides.global = MyHttpOverrides();
}
