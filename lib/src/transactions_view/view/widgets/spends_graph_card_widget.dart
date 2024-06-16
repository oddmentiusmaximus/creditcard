import 'package:creditcard/src/transactions_view/controller/transaction_controller.dart';
import 'package:creditcard/src/transactions_view/view/widgets/transaction_graph.dart';
import 'package:creditcard/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpendsGraphCardWidget extends GetView<TransactionController> {
  const SpendsGraphCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 16,
        ),
        // Dummy function to create mock data
        child: Obx(
          () {
            if (controller.isDataLoading.value) {
              return const CircularProgressIndicator();
            } else if (!controller.isDataLoading.value &&
                controller.transactions.isEmpty) {
              return const Text("Something went wrong");
            }
            return TransactionGraph(
              transactionData: controller.transactions,
              key: const Key(Constants.graphWidgetKey),
              size: 20,
            );
          },
        ),
      ),
    );
  }
}
