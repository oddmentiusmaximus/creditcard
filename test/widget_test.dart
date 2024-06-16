import 'package:creditcard/main.dart';
import 'package:creditcard/src/transactions_view/view/transactions_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('MyApp', () {
    testWidgets('MyApp is in the widget tree', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(TransactionsView), findsOneWidget);
    });

    testWidgets('GetMaterialApp is in the widget tree',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      // Verify that debugShowCheckedModeBanner is set to false
      expect(
        tester
            .widget<GetMaterialApp>(find.byType(GetMaterialApp))
            .debugShowCheckedModeBanner,
        isFalse,
      );

      expect(find.byType(GetMaterialApp), findsOneWidget);
    });

    testWidgets('TransactionsView is in the widget tree',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(TransactionsView), findsOneWidget);
    });
  });
}
