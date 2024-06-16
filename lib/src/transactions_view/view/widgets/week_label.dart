import 'package:creditcard/src/utils/constants.dart';
import 'package:flutter/material.dart';

class WeekLabel extends StatelessWidget {
  const WeekLabel({
    super.key,
    required this.fontSize,
    required this.size,
    required this.margin,
  });

  final double fontSize;
  final double size;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }

  Widget _buildView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: Constants.listOfDays
          .asMap()
          .entries
          .map((day) => _renderWeekLabel(day.key, day.value))
          .toList(),
    );
  }

  Widget _renderWeekLabel(int index, String day) {
    return DayLabel(
      day: day,
      size: size,
    );
  }
}

class DayLabel extends StatelessWidget {
  const DayLabel({
    super.key,
    this.fontSize = 10,
    this.size = 20,
    this.margin = 2,
    required this.day,
  });

  final double fontSize;
  final double size;
  final double margin;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.all(margin),
      child: Center(
        child: Text(
          day,
          maxLines: 1,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
