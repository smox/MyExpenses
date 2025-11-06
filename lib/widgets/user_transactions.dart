import 'package:flutter/material.dart';
import 'package:myexpenses/widgets/new_transactions.dart';
import 'package:myexpenses/widgets/transaction_list.dart';
import 'package:decimal/decimal.dart';
import 'package:myexpenses/model/transaction.dart';
import 'package:myexpenses/util/id.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
      id: Id.now(),
      title: "Gaming Laptop",
      amount: Decimal.parse("1794.9"),
      date: DateTime.parse("2025-10-27 20:15"),
    ),
    Transaction(
      id: Id.now(),
      title: "Neue Schue",
      amount: Decimal.parse("49.99"),
      date: DateTime.parse("2025-10-29 12:48"),
    ),
    Transaction(
      id: Id.now(),
      title: "Melange",
      amount: Decimal.parse("4.99"),
      date: DateTime.parse("2025-10-29 13:25"),
    ),
    Transaction(
      id: Id.now(),
      title: "Smartphone",
      amount: Decimal.parse("794.9"),
      date: DateTime.parse("2025-10-27 20:15"),
    ),
    Transaction(
      id: Id.now(),
      title: "Boxen",
      amount: Decimal.parse("26"),
      date: DateTime.parse("2025-10-29 12:48"),
    ),
    Transaction(
      id: Id.now(),
      title: "Shirt",
      amount: Decimal.parse("13.37"),
      date: DateTime.parse("2025-10-29 13:25"),
    ),
  ];

  void addNewTransaction(String title, Decimal amount) {
    print("Calling addNewTransaction with ${title} and ${amount}");
    final newTx = Transaction(
      id: Id.now(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      print("Adding to list");
      transactions.add(newTx);
      print("Updating state...");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(addNewTransaction: addNewTransaction),
        Expanded(
          child: TransactionList(transactions: transactions),
        ),
      ],
    );
  }
}
