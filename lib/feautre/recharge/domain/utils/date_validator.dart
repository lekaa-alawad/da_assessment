class DateValidator {
  DateValidator(this.lastTransactionDate);
  final DateTime lastTransactionDate;
  bool isNewMonth() {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;

    final lastTransactionMonth = lastTransactionDate.month;
    final lastTransactionYear = lastTransactionDate.year;

    if (currentYear > lastTransactionYear ||
        (currentYear == lastTransactionYear && currentMonth != lastTransactionMonth)) {
      return true; // It's a new month
    } else {
      return false; // It's the same month
    }
  }
}
