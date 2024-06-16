enum WeekVisibilityType {
  none('none'),
  oddDays('oddDays'),
  evenDays('evenDays'),
  all('all');

  final String value;

  const WeekVisibilityType(this.value);
}

enum MonthVisibilityType {
  none,
  short,
  full,
}

enum TransactionType {
  credit,
  debit,
}
