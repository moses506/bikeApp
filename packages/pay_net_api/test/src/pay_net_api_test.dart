// ignore_for_file: prefer_const_constructors
import 'package:pay_net_api/src/pay_net_api.dart';
import 'package:test/test.dart';

void main() {
  group('NetworkApi', () {
    test('can be instantiated', () {
      expect(PayNetApi(baseUrl: '', baseHost: ''), isNotNull);
    });
  });
}
