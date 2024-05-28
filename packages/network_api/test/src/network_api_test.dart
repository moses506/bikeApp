// ignore_for_file: prefer_const_constructors
import 'package:network_api/network_api.dart';
import 'package:test/test.dart';

void main() {
  group('NetworkApi', () {
    test('can be instantiated', () {
      expect(NetworkApi.init(baseUrl: '', host: ''), isNotNull);
    });
  });
}
