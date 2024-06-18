// Copyright (c) 2022, Very Good Ventures

// https://verygood.ventures

//

// Use of this source code is governed by an MIT-style

// license that can be found in the LICENSE file or at

// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'dart:developer';

import 'dart:io';

import 'package:dio/dio.dart';

import 'package:dio/io.dart';

import 'package:network_api/network_api.dart';

// import 'package:network_api/src/network_source.dart';

/// {@template network_api}

/// Network interface handling all network connectivity

/// {@endtemplate}

class NetworkApi implements NetworkSource {
  /// {@macro network_api}

  NetworkApi._create();

  /// Public factory

  static Future<NetworkApi> init({
    required String baseUrl,
    required String host,
    String? token,
  }) async {
    final netApi = NetworkApi._create();

    await netApi._init(baseUrl: baseUrl, host: host, token: token);

    return netApi;
  }

  late Dio _client;
  Future<void> _init({
    required String baseUrl,
    required String host,
    String? token = '',
    String? bearer = 'bearer:', // Corrected spelling from 'baerer' to 'bearer'
  }) async {
    final options = BaseOptions(
      baseUrl: baseUrl,
      followRedirects: true,
      receiveDataWhenStatusError: true,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$bearer ${token ?? ''}',
      },
      // Adjust connectTimeout to a suitable Duration object (e.g., 30 seconds)
      connectTimeout: Duration(milliseconds: 30000),
      // 30 seconds
      validateStatus: null, // Disable SSL certificate validations
    );

    _client = Dio(options);

    (_client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => host == host;
      return client;
    };
  }

  // Future<void> _init({
  //   required String baseUrl,
  //   required String host,
  //   String? token = '',
  //   String? bearer = 'bearer:', // Corrected spelling from 'baerer' to 'bearer'
  // }) async {
  //   final options = BaseOptions(
  //     baseUrl: baseUrl,
  //     followRedirects: true,
  //     receiveDataWhenStatusError: true,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //       'Authorization': '$bearer ${token ?? ''}',
  //     },
  //     validateStatus: null, // Disable SSL certificate validation
  //   );

  //   _client = Dio(options);

  //   (_client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (HttpClient client) {
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => host == host;
  //     return client;
  //   };
  // }

  /// Default error message

  String error = 'Something went wrong.';

  final _controller = StreamController<int>();

  /// Authentication status of user at any given point

  Stream<int> get uploadProgress async* {
    yield 0;

    yield* _controller.stream;
  }

  @override
  Future<NetResponse> get(String route, {JsonMap? data}) async {
    try {
      final response = await _client.get<JsonMap>(route, data: data);

      log('Response @ $route: ${response.data}');

      return NetResponse.fromJson(response.data);
    } catch (e) {
      log('Error @ $route: $e');

      return NetResponse(status: 'error', data: error, message: error);
    }
  }

  @override
  Future<NetResponse> post(String route, JsonMap body) async {
    try {
      final resp = await _client.post<String>(
        route,
        data: FormData.fromMap(body),
      );

      log('Response @ $route: ${resp.data}');

      if (route == 'log-in') {
        return NetResponse.withBool(resp.data);
      }

      // return NetResponse.fromString(resp.data);

      return NetResponse.withBool(resp.data);
    } catch (e) {
      log('Error @ $route: $e');

      return NetResponse(status: 'error', message: error);
    }
  }

  @override
  Future<NetResponse> put(String route, JsonMap body) async {
    try {
      final response = await _client.put<JsonMap>(route, data: body);

      log('Response @ $route: ${response.data}');

      return NetResponse.fromJson(response.data);
    } catch (e) {
      log('Error @ $route: $e');

      return NetResponse(status: 'error', data: error, message: error);
    }
  }

  @override
  Future<NetResponse> upload(
    String route,
    JsonMap body, {
    JsonMap? files,
  }) async {
    try {
      if (files != null) {
        for (final file in files.entries) {
          body[file.key] = await MultipartFile.fromFile(file.value.toString());
        }
      }

      final formData = FormData.fromMap(body);

      final response = await _client.post<JsonMap>(
        route,
        data: formData,
        onSendProgress: (sent, total) {
          final progress = sent / total * 100;

          _controller.add(progress.toInt());

          log('progress: ${progress.toStringAsFixed(0)}% ($sent/$total)');
        },
      );

      log(response.data.toString());

      _controller.add(0);

      return NetResponse.fromJson(response.data);
    } catch (e) {
      log(e.toString());

      _controller.add(0);

      return NetResponse(status: 'error', message: error);
    }
  }

  // Future<NetResponse> upload(String route, JsonMap body) async {

  //   try {

  //     final formData = FormData.fromMap(body);

  //     final response = await _client.post<JsonMap>(

  //       route,

  //       data: formData,

  //       onSendProgress: (sent, total) {

  //         final progress = sent / total * 100;

  //         _controller.add(progress.toInt());

  //         log('progress: ${progress.toStringAsFixed(0)}% ($sent/$total)');

  //       },

  //     );

  //     log('Response @ $route: ${response.data}');

  //     _controller.add(0);

  //     return NetResponse.fromJson(response.data);

  //   } catch (e) {

  //     log('Error @ $route: $e');

  //     _controller.add(0);

  //     return NetResponse(status: 'error', data: error, message: error);

  //   }

  // }

  @override
  Future download(String route, String savePath, JsonMap? body) {
    // TODO: implement download

    throw UnimplementedError();
  }
}
