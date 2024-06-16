import 'package:creditcard/src/transactions_view/model/transaction.dart';
import 'package:creditcard/src/transactions_view/repository/mock_repository.dart';
import 'package:creditcard/src/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  late MockApi mockApi;
  RxMap<DateTime, List<Transaction>> transactions = RxMap();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  late ScrollController graphScrollController;
  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    mockApi = MockApi();
    graphScrollController = ScrollController();
    super.onInit();
  }

  @override
  void onReady() {
    getTransactions();
    super.onReady();
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  double selectedDayTotal(List<Transaction> transaction) {
    double sum = 0;
    for (var element in transaction) {
      if (element.type == TransactionType.debit) {
        sum += element.amount;
      }
    }
    return sum.toPrecision(2);
  }

  Future<Map<DateTime, List<Transaction>>> getTransactions() async {
    isDataLoading(true);
    transactions.value = await mockApi.getTransactionByDateTime();
    selectedDate.value = DateTime.now();
    isDataLoading(false);

    return transactions;
  }

  @override
  void onClose() {
    graphScrollController.dispose();
    super.onClose();
  }
}
