import 'package:app_repo/app_repo.dart';
import 'package:bicycle_app/app/app.dart';
import 'package:bicycle_app/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App(AppRepo.init(config: config),));
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
