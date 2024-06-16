import 'package:creditcard/src/transactions_view/controller/transaction_controller.dart';
import 'package:creditcard/src/transactions_view/model/transaction.dart';
import 'package:creditcard/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleDayTransaction extends GetView<TransactionController> {
  final DateTime date;
  final double? size;
  final double? margin;
  final double? borderRadius;
  final Color? noTransactionColor;
  final Color? baseColor;
  final List<Transaction> transactions;

  // Over all max spend a day, through out the year
  final double maxTransactionPerDay;

  const SingleDayTransaction({
    super.key,
    required this.date,
    required this.transactions,
    required this.maxTransactionPerDay,
    this.noTransactionColor,
    this.baseColor,
    this.size,
    this.margin,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.updateSelectedDate(date);
      },
      child: Container(
        height: size ?? 20,
        width: size ?? 20,
        margin: EdgeInsets.all(margin ?? 2),
        decoration: BoxDecoration(
          color: transactions.isEmpty
              ? noTransactionColor ?? Constants.emptyColor
              : (baseColor ?? Constants.graphPrimaryColor)
                  .withOpacity((totalActivityAmount() / maxTransactionPerDay)),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 4),
          ),
          border: Border.all(color: Colors.white, width: 0.5),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            DateTime.now().day == date.day &&
                    DateTime.now().month == date.month &&
                    DateTime.now().year == date.year
                ? 0.0
                : 2.0,
          ),
          child: Text(
            "${DateTime.now().day == date.day && DateTime.now().month == date.month && DateTime.now().year == date.year ? "now" : date.day}",
            style: const TextStyle(fontSize: 8),
          ),
        ),
      ),
    );
  }

  double totalActivityAmount() {
    double sum = 0;
    for (var element in transactions) {
      sum += element.amount;
    }
    return sum;
  }
}
