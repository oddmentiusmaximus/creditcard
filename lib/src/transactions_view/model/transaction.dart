import 'package:creditcard/src/utils/enums.dart';

class Transaction {
  final DateTime time;
  final double amount;
  final String id;
  final String name;
  final TransactionType type;

  Transaction({
    required this.time,
    required this.amount,
    required this.name,
    required this.id,
    required this.type,
  });

  // to JSON method if needed for API response
  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'amount': amount,
      'id': id,
      'name': name,
      'type': type,
    };
  }
}
