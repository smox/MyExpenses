import 'package:decimal/decimal.dart';

class Transaction {
  String id;
  String title;
  Decimal amount;
  DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
