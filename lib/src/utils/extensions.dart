extension DateTimeDaysBetween on DateTime {
  // Reference: https://stackoverflow.com/questions/52713115/flutter-find-the-number-of-days-between-two-dates/67679455#67679455
  int daysBetween({required DateTime fromDate}) {
    final to = DateTime(year, month, day);
    final from = DateTime(fromDate.year, fromDate.month, fromDate.day);
    return (to.difference(from).inHours / 24).round();
  }
}

extension IntDigits on int {
  List<int> get digits {
    final List<int> list = [];
    int tmp = this;
    while (tmp > 0) {
      list.add(tmp % 10);
      tmp = tmp ~/ 10;
    }

    return list.reversed.toList();
  }
}
