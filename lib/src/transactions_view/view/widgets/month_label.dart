import 'package:creditcard/src/utils/constants.dart';
import 'package:flutter/material.dart';

class MonthLabel extends StatelessWidget {
  const MonthLabel({
    super.key,
    required this.startDate,
    required this.size,
    required this.fontSize,
  });

  final DateTime startDate;
  final double fontSize;
  final double size;

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }

  Widget _buildView() {
    return Padding(
      padding: EdgeInsets.only(left: size),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: Constants.listOfMonths.asMap().entries.map(
          (e) {
            return SizedBox(
              width: size * 5,
              child: Text(
                Constants.listOfMonths[(e.key + (startDate).month - 1) % 12],
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: fontSize),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
