import 'package:network_api/network_api.dart';

/// {@template net_source}
/// The interface and models for an API providing access to the network.
/// {@endtemplate}
abstract class NetworkSource {
  /// {@macro network_api}
  const NetworkSource();

  /// Sends a get request to the provided route
  Future<dynamic> get(String route);

  /// Sends a post request to the provided route
  Future<dynamic> post(String route, JsonMap body);

  /// Sends a post request to the provided route
  Future<dynamic> put(String route, JsonMap body);

  /// Sends a post request to the provided route
  Future<dynamic> upload(String route, JsonMap body);

  /// Sends a download request to the provided route
  Future<dynamic> download(String route, String savePath, JsonMap? body);
}
