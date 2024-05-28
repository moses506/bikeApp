import 'package:pay_net_api/pay_net_api.dart';

/// {@template net_source}
/// The interface and models for an API providing access to the network.
/// {@endtemplate}
abstract class NetworkSource {
  /// {@macro network_api}
  const NetworkSource();

  /// Sends a get request to the provided route
  Future<dynamic> get(String route);

  /// Sends a post request to the provided route
  Future<dynamic> post(String route, JMap body);

  /// Sends a post request to the provided route
  Future<dynamic> put(String route, JMap body);

  /// Sends a post request to the provided route
  Future<dynamic> upload(String route, JMap body);

  /// Sends a download request to the provided route
  Future<dynamic> download(String route, String savePath, JMap? body);
}
