import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const List<String> listOfDays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  static const List<String> listOfMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
    'Current',
  ];

  static const List<String> dummyCompanies = [
    "Tech Solutions Inc.",
    "Green Energy Co.",
    "Blue Ocean Enterprises",
    "NextGen Innovations",
    "BrightFuture Technologies",
    "Digital Dynamics Ltd.",
    "Urban Ventures Group",
    "Solar Power Corp.",
    "Silverline Solutions",
    "Quantum Leap Enterprises",
  ];

  static Color emptyColor = Colors.white.withOpacity(0.6);
  static Color graphPrimaryColor = const Color(0xff19cb37);

  // keys

  static const String displayDateWidgetKey = 'displayed-ful-date';
  static const String totalAmountWidgetKey = 'total-amount';
  static const String graphWidgetKey = 'graph-widget';
}
