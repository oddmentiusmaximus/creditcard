import 'dart:math';

import 'package:creditcard/src/transactions_view/controller/transaction_controller.dart';
import 'package:creditcard/src/transactions_view/model/transaction.dart';
import 'package:creditcard/src/transactions_view/view/widgets/custom_animation.dart';
import 'package:creditcard/src/transactions_view/view/widgets/month_label.dart';
import 'package:creditcard/src/transactions_view/view/widgets/single_day.dart';
import 'package:creditcard/src/transactions_view/view/widgets/week_label.dart';
import 'package:creditcard/src/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionGraph extends GetView<TransactionController> {
  const TransactionGraph({
    super.key,
    required this.transactionData,
    this.startDate,
    this.size = 20,
    this.fontSize = 12,
    this.margin = 2,
    this.baseColor,
    this.noTransactionColor,
  });

  final DateTime? startDate;
  final Map<DateTime, List<Transaction>> transactionData;
  final double? size;
  final double? fontSize;
  final double? margin;
  final Color? noTransactionColor;
  final Color? baseColor;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller.graphScrollController,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 8),
            child: WeekLabel(
              fontSize: 12,
              size: 21,
              margin: margin ?? 2,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              controller: controller.graphScrollController,
              scrollDirection: Axis.horizontal,
              child: _buildView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MonthLabel(
          startDate: startDate ?? DateTime.now(),
          size: size ?? 20,
          fontSize: fontSize ?? 12,
        ),
        Row(children: [..._buildWeeks()]),
      ],
    );
  }

  // Function to build all the week of year to show on UI

  List<Widget> _buildWeeks() {
    // This holds list of columns, which will be later children of a row.
    List<Widget> weeks = [];
    DateTime today = startDate ?? DateTime.now();
    DateTime aYearBack = today.copyWith(
      year: today.year - 1,
    );
    int totalDays = today.difference(aYearBack).inDays;

    int firstDay = aYearBack.weekday;

    // max transaction amount in a day, later to be used for color shade to represent amount spent.
    double maxTransactionPerDay = 0;
    transactionData.forEach((key, value) {
      maxTransactionPerDay = max(
        maxTransactionPerDay,
        value.fold(
          0.0,
          (previousValue, element) => previousValue + element.amount,
        ),
      );
    });

    // if the first day of week is not sunday, to calculate empty boxes to how on the graph
    int startOfLoop = 0;
    if (firstDay != 7) {
      startOfLoop = 7 - firstDay;

      // UI for first week of the year
      weeks.add(
        _firstWeek(
          firstDay,
          aYearBack,
          maxTransactionPerDay,
        ),
      );
    }

    // for the rest of the week
    for (int day = startOfLoop; day < totalDays; day += 7) {
      // first day of selected week
      DateTime weekStartDate = aYearBack.copyWith(day: aYearBack.day + day);

      // last day of selected week
      DateTime weekEndDate = (day >= totalDays - 7)
          ? today
          : aYearBack.copyWith(day: aYearBack.day + day + 7);
      int dayDifference = weekEndDate.difference(weekStartDate).inDays;

      weeks.add(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: generateRestWeeks(
            dayDifference,
            day,
            weekStartDate,
            maxTransactionPerDay,
          ),
        ),
      );
    }

    return weeks;
  }

  List<Widget> generateRestWeeks(
    int dayDifference,
    int day,
    DateTime weekStartDate,
    double maxTransactionPerDay,
  ) {
    return [
      ...List.generate(
        dayDifference < 7 ? dayDifference + 1 : dayDifference,
        (index) => SingleDayTransactionAnimation(
          animationUpToSize: (size ?? 20) + (margin ?? 2) * 2,
          dayDifferenceFromStart: day,
          child: SingleDayTransaction(
            key: Key(
              DateFormattingUtils.toDDMMMYYYYObject(
                weekStartDate.copyWith(day: weekStartDate.day + index),
              ).toString(),
            ),
            date: weekStartDate.copyWith(day: weekStartDate.day + index),
            maxTransactionPerDay: maxTransactionPerDay,
            noTransactionColor: noTransactionColor,
            baseColor: baseColor,
            // Using [Map<DateTime,List<Transaction>>] object to fetch all the transactions done on a day
            transactions: transactionData[DateFormattingUtils.toDDMMMYYYYObject(
                  weekStartDate.copyWith(
                    day: weekStartDate.day + index,
                  ),
                )] ??
                [],
          ),
        ),
      ),

      // black days to fill
      if (dayDifference < 7)
        ...List.generate(
          7 - (dayDifference < 7 ? dayDifference + 1 : dayDifference),
          (index) => SingleDayTransactionAnimation(
            animationUpToSize: (size ?? 20) + (margin ?? 2) * 2,
            dayDifferenceFromStart: index,
            child: emptyDay(),
          ),
        ),
    ];
  }

  List<Widget> generateFirstWeek(
    int initialEmptyDays,
    DateTime startDate,
    double maxTransactionPerDay,
  ) {
    return [
      // blank days, days not to display on UI
      ...List.generate(
        initialEmptyDays,
        (index) => SingleDayTransactionAnimation(
          animationUpToSize: (size ?? 20) + (margin ?? 2) * 2,
          dayDifferenceFromStart: index,
          child: emptyDay(),
        ),
      ),

      // days to display on UI
      ...List.generate(
        7 - initialEmptyDays,
        (index) => SingleDayTransactionAnimation(
          animationUpToSize: (size ?? 20) + (margin ?? 2) * 2,
          dayDifferenceFromStart: index,
          child: SingleDayTransaction(
            key: Key(
              DateFormattingUtils.toDDMMMYYYYObject(
                startDate.copyWith(day: startDate.day + index),
              ).toString(),
            ),
            date: startDate.copyWith(day: startDate.day + index),
            maxTransactionPerDay: maxTransactionPerDay,
            noTransactionColor: noTransactionColor,
            baseColor: baseColor,
            // Using [Map<DateTime,List<Transaction>>] object to fetch all the transactions done on a day
            transactions: transactionData[DateFormattingUtils.toDDMMMYYYYObject(
                  startDate.copyWith(
                    day: startDate.day + index,
                  ),
                )] ??
                [],
          ),
        ),
      ),
    ];
  }

  Widget _firstWeek(
    int initialEmptyDays,
    DateTime startDate,
    double maxTransactionPerDay,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: generateFirstWeek(
        initialEmptyDays,
        startDate,
        maxTransactionPerDay,
      ),
    );
  }

  Widget emptyDay() {
    return SizedBox(
      height: size ?? 20,
      width: size ?? 20,
    );
  }
}
