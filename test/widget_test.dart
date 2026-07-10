import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nailvault/app/app.dart';

void main() {
  testWidgets('app builds smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: NailVaultApp()));
    await tester.pump();

    expect(find.byType(NailVaultApp), findsOneWidget);
  });
}
