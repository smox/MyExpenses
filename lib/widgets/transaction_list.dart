import 'package:flutter/material.dart';
import 'package:myexpenses/model/transaction.dart';
import 'package:myexpenses/util/decimal_ext.dart';
import 'package:myexpenses/util/date_time_ext.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tx = transactions[index];
        return Card(
          child: Row(
            children: [
              Container(
                width: 80,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: const EdgeInsets.all(5),
                child: Text(
                  tx.amount.formatCurrency(fractionDigits: 2),
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tx.title),
                  Text(tx.date.toLocaleDateTime()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
