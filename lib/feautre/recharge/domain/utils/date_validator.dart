import 'package:da_assessment/feautre/recharge/domain/utils/validator_interface.dart';

class NewMothValidator extends ValidatorInterface {
  NewMothValidator(this.lastTransactionDate);
  final DateTime lastTransactionDate;
  @override
  bool isValid() {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;

    final lastTransactionMonth = lastTransactionDate.month;
    final lastTransactionYear = lastTransactionDate.year;

    return (currentYear > lastTransactionYear ||
            (currentYear == lastTransactionYear && currentMonth != lastTransactionMonth))
        ? true
        : false;
  }
}
