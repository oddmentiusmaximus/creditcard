import 'package:creditcard/src/transactions_view/binding/binding.dart';
import 'package:creditcard/src/transactions_view/controller/transaction_controller.dart';
import 'package:creditcard/src/transactions_view/view/widgets/transaction_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('TransactionGraph', () {
    testWidgets('Scrollbar and SingleChildScrollView are in the widget tree',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialBinding: TransactionBinding(),
          home: const Scaffold(
            body: TransactionGraph(
              transactionData: {}, // provide your transaction data here
            ),
          ),
        ),
      );

      expect(find.byType(Scrollbar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    setUp(() => Get.put(TransactionController()));

    testWidgets('SingleChildScrollView is horizontally scrollable',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialBinding: TransactionBinding(),
          home: Scaffold(
            body: TransactionGraph(
              transactionData: Get.find<TransactionController>()
                  .transactions, // provide your transaction data here
            ),
          ),
        ),
      );

      final scrollViewFinder = find.byType(SingleChildScrollView);
      final scrollView = tester.widget<SingleChildScrollView>(scrollViewFinder);
      final initialScrollOffset = scrollView.controller!.offset;

      // await tester.drag(
      //   scrollViewFinder,
      //   const Offset(-300.0, 0.0),
      // ); // swipe to the left
      await tester.drag(
        scrollViewFinder,
        const Offset(300.0, 0.0),
      ); // swipe to the right
      await tester.pumpAndSettle();
      expect(scrollView.controller!.offset, isNot(equals(initialScrollOffset)));
    });
  });
}
