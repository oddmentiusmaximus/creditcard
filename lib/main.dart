import 'package:creditcard/src/transactions_view/binding/binding.dart';
import 'package:creditcard/src/transactions_view/view/transactions_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'src/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Constants.graphPrimaryColor),
        useMaterial3: true,
      ),
      initialBinding: TransactionBinding(),
      home: const TransactionsView(),
    );
  }
}
