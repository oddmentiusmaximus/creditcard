import 'package:creditcard/src/transactions_view/model/transaction.dart';
import 'package:creditcard/src/transactions_view/repository/mock_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Transaction By Date Time', () {
    final mockApi = MockApi();

    test('getTransactionByDateTime returns Map<DateTime, List<Transaction>>',
        () async {
      var result = await mockApi.getTransactionByDateTime();
      expect(result, isA<Map<DateTime, List<Transaction>>>());
    });

    test('getTransactionByDateTime returns correct dates', () async {
      var result = await mockApi.getTransactionByDateTime();
      var expectedDates = result.keys.toList();
      expect(result.keys, equals(expectedDates));
    });

    test('getTransactionByDateTime returns correct transactions', () async {
      var result = await mockApi.getTransactionByDateTime();
      var expectedTransactions = result.values.toList();
      expect(result.values, equals(expectedTransactions));
    });
  });

  group('Transaction Dummy Data', () {
    final mockApi = MockApi();

    test('generateDummyTransactions returns List<Transaction>', () {
      var result = mockApi.generateDummyTransactions();
      expect(result, isA<List<Transaction>>());
    });
  });
}
