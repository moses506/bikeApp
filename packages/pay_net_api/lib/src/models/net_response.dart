import 'dart:convert';

import 'package:pay_net_api/pay_net_api.dart';


part 'net_response.g.dart';

/// A data object used to parse network responses from our API
class NetResponse {
  /// {@macro net_response}
  const NetResponse({required this.message, this.data, this.status});

  /// The data returned from the network request
  final dynamic data;

  /// A message describing the status of the response
  final String message;

  /// a status message
  final int? status;

  /// Deserializes the given [dynamic] into a [NetResponse].
  static NetResponse fromJson(dynamic json) => _$NetResponseFromJson(json);

  /// Deserializes the given [dynamic] into a [NetResponse].
  static NetResponse fromString(dynamic json) => _$NetResponseFromString(json);

  /// Deserializes the given [dynamic] into a [NetResponse].
  static NetResponse withBool(dynamic json) => _$NetResponseWithBool(json);

  /// Check whether network request was successful
  bool isSuccessful() => status == 0;
}
