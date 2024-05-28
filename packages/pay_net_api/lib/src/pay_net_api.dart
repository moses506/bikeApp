import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:pay_net_api/pay_net_api.dart';

/// {@template network_api}
/// A package to handle network communication.
/// {@endtemplate}
class PayNetApi extends NetworkSource {
  /// {@macro network_api}
  PayNetApi({
    required String baseUrl,
    required String baseHost,
  }) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      followRedirects: true,
      receiveDataWhenStatusError: true,
      validateStatus: (status) {
        return (status ?? 501) < 501;
      },
    );
    _client = Dio(options);
    // ignore: deprecated_member_use
    (_client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => host == baseHost;
      return client;
    };
  }

  late Dio _client;

  /// Default error message
  String error = 'Something went wrong.';

  final _controller = StreamController<double>();

  /// Progress of an upload or download
  Stream<double> get loadProgress async* {
    yield 0;
    yield* _controller.stream;
  }

  @override
  Future<NetResponse> get(String route, {Map<String, dynamic>? params}) async {
    try {
      final response =
          await _client.get<dynamic>(route, queryParameters: params);
      log('Response @ $route: ${response.data}');
      return NetResponse.fromJson(response.data);
    } catch (e) {
      log('Error @ $route: $e');
      return NetResponse(status: 1, message: error);
    }
  }

  @override
  Future<NetResponse> post(String route, JMap body) async {
    try {
      final resp = await _client.post<String>(
        route,
        data: FormData.fromMap(body),
      );
      log('Response @ $route: ${resp.data}');
      if (route == 'User/Auth') {
        return NetResponse.withBool(resp.data);
      }
      return NetResponse.fromString(resp.data);
    } catch (e) {
      log('Error @ $route: $e');
      return NetResponse(status: 1, message: error);
    }
  }

  @override
  Future<NetResponse> put(String route, JMap body) async {
    try {
      final response = await _client.put<String>(
        route,
        data: FormData.fromMap(body),
      );
      log('Response @ $route: ${response.data}');
      return NetResponse.fromJson(response.data);
    } catch (e) {
      log('Error @ $route: $e');
      return NetResponse(status: 1, message: error);
    }
  }

  @override
  Future<NetResponse> upload(String route, JMap body) async {
    try {
      final formData = FormData.fromMap(body);
      final response = await _client.post<String>(
        route,
        data: formData,
        onSendProgress: (sent, total) {
          final progress = sent / total * 100;
          _controller.add(progress);
          log('progress: ${progress.toStringAsFixed(1)}% ($sent/$total)');
        },
      );
      log('Response @ $route: ${response.data}');
      _controller.add(0);
      return NetResponse.fromJson(response.data);
    } catch (e) {
      log('Error @ $route: $e');
      _controller.add(0);
      return NetResponse(status: 1, message: error);
    }
  }

  @override
  Future<NetResponse> download(
    String route,
    String savePath,
    JMap? body,
  ) async {
    try {
      final response = await _client.download(
        route,
        savePath,
        data: body != null ? FormData.fromMap(body) : null,
        onReceiveProgress: (sent, total) {
          final progress = sent / total * 100;
          _controller.add(progress);
          log('progress: ${progress.toStringAsFixed(1)}% ($sent/$total)');
        },
      );
      log('Response @ $route: ${response.data}');
      _controller.add(0);
      return NetResponse.fromJson(response.data);
    } catch (e) {
      log('Error @ $route: $e');
      _controller.add(0);
      return NetResponse(status: 1, message: error);
    }
  }
}
