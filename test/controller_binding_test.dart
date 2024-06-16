import 'package:creditcard/src/transactions_view/controller/transaction_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('TransactionController', () {
    late TransactionController transactionController;

    setUp(() {
      transactionController = Get.put(TransactionController());
    });

    tearDown(() {
      Get.delete<TransactionController>();
    });

    test('TransactionController is registered', () {
      expect(Get.isRegistered<TransactionController>(), isTrue);
    });

    test('TransactionController is initialized correctly', () {
      final controller = Get.find<TransactionController>();
      expect(controller, isNotNull);
      expect(controller.transactions, isNotNull);
      expect(controller.selectedDate, isNotNull);
      expect(
        controller.selectedDate.value.day,
        Rx<DateTime>(DateTime.now()).value.day,
      );
      expect(controller.isDataLoading, isNotNull);
    });
  });
}
