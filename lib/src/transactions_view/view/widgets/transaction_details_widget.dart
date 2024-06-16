import 'package:creditcard/src/transactions_view/model/transaction.dart';
import 'package:creditcard/src/transactions_view/view/widgets/transaction_tile_widget.dart';
import 'package:creditcard/src/utils/constants.dart';
import 'package:creditcard/src/utils/date_utils.dart';
import 'package:flutter/material.dart';

class TransactionDetailsWidget extends StatelessWidget {
  const TransactionDetailsWidget({
    super.key,
    required this.transactions,
    required this.date,
    required this.totalAmount,
  });

  final List<Transaction> transactions;
  final DateTime date;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              Text(
                'Total Spends',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormattingUtils.toDDMMMYYYY(date),
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                key: const Key(Constants.displayDateWidgetKey),
              ),
              Text(
                "₹$totalAmount",
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                key: const Key(Constants.totalAmountWidgetKey),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 7,
          ),
          if (transactions.isEmpty)
            const Center(
              child: Text("No Transactions found."),
            ),
          if (transactions.isNotEmpty)
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  key: Key(transactions[index].id),
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: TransactionTile(transaction: transactions[index]),
                );
              },
            ),
        ],
      ),
    );
  }
}
