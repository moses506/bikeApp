// ignore_for_file: prefer_const_constructors
import 'package:local_data_source/local_data_source.dart';
import 'package:test/test.dart';

void main() {
  group('LocalDataSource', () {
    test('can be instantiated', () {
      expect(LocalDataSource.init(dbName: '', initialScript: ['']), isNotNull);
    });
  });
}
