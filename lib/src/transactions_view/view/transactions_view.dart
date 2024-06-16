import 'package:creditcard/src/transactions_view/model/transaction.dart';
import 'package:creditcard/src/transactions_view/view/widgets/credit_card.dart';
import 'package:creditcard/src/transactions_view/view/widgets/spends_graph_card_widget.dart';
import 'package:creditcard/src/transactions_view/view/widgets/transaction_details_widget.dart';
import 'package:creditcard/src/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transaction_controller.dart';

class TransactionsView extends GetView<TransactionController> {
  const TransactionsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text(
          'Hi Sawan Pimpalkhare!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.getTransactions();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black54,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 25,
                right: 16.0,
                left: 16.0,
              ),
              child: CreditCard(
                cardExpiration: "07/28",
                cardHolder: "Sawan Pimpalkhare",
                cardNumber: "1234\t5678\t9012\t3456",
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.7,
              maxChildSize: 1.0,
              minChildSize: 0.7,
              expand: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Divider(
                                indent: Get.width / 3,
                                endIndent: Get.width / 3,
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.auto_graph,
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    'Spend analysis',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const SpendsGraphCardWidget(),
                              Obx(() {
                                final List<Transaction> filteredTransaction =
                                    controller.transactions[DateFormattingUtils
                                            .toDDMMMYYYYObject(
                                          controller.selectedDate.value,
                                        )] ??
                                        [];

                                return TransactionDetailsWidget(
                                  transactions: filteredTransaction,
                                  date: controller.selectedDate.value,
                                  totalAmount: controller
                                      .selectedDayTotal(filteredTransaction),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
