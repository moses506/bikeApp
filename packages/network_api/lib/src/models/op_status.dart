import 'package:network_api/src/models/net_response.dart';

/// Returns the status of an operation.
class OpStatus {
  /// {@macro OpStatus}
  OpStatus({
    required this.message,
    required this.success,
    this.data,
    this.code = '00',
  });

  /// Returns a [OpStatus] representation from a [NetResponse].
  factory OpStatus.fromResponse(NetResponse response) {
    return OpStatus(
      message: response.message,
      success: response.isSuccessful(),
      data: response.data,
    );
  }

  /// Returns a [OpStatus] error with a [message].
  factory OpStatus.success(String message, {Map<String, dynamic>? data}) {
    return OpStatus(
      success: true,
      message: message,
      data: data,
    );
  }

  /// Returns a [OpStatus] error with a [message].
  factory OpStatus.error(String message) {
    return OpStatus(message: message, success: false);
  }

  /// String [message] to give a description of the status.
  final String message;

  /// bool [success] for whether the operation was successful or not.
  final bool success;

  /// a String [code] representing the response code from an operation
  final String? code;

  /// Optional JsonMap [data] to return from the network operation.
  final dynamic data;
}
