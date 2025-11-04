import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/transaction.dart';
import 'package:myexpenses/util/decimal_ext.dart';
import 'package:myexpenses/util/date_time_ext.dart';
import 'package:myexpenses/util/id.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoMonoTextTheme(), // 👈 überall Roboto Mono
        useMaterial3: false,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> transactions = [
    Transaction(
      id: Id.now(),
      title: "Gaming Latop",
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: transactions.map((tx) {
          return Card(
            child: Row(
              children: [
                Container(
                  width: 80,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    tx.amount.formatCurrency(fractionDigits: 2),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tx.title),
                    Text(tx.date
                        .toLocaleDateTime()), //Text(tx.date.toLocal().toString()),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
