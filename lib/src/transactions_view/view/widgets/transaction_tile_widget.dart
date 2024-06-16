import 'package:creditcard/src/transactions_view/model/transaction.dart';
import 'package:creditcard/src/utils/date_utils.dart';
import 'package:creditcard/src/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Icon(
              transaction.type == TransactionType.credit
                  ? Icons.add
                  : Icons.minimize,
              color: transaction.type == TransactionType.credit
                  ? Colors.green.withOpacity(0.6)
                  : Colors.red.withOpacity(0.6),
              size: 17,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.name,
                style: const TextStyle(fontSize: 13),
              ),
              Text(
                DateFormattingUtils.to12Hrs(transaction.time),
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          '${transaction.type == TransactionType.credit ? '' : '-'}₹${transaction.amount.toPrecision(2)}',
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
