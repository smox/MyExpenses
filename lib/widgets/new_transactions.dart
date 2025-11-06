import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function addNewTransaction;
  const NewTransactions({Key? key, required this.addNewTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return Column(children: [
      Padding(
        child: TextField(
          decoration: InputDecoration(labelText: "Title"),
          controller: titleController,
          //onChanged: (val) => val,
        ),
        padding: EdgeInsets.all(10),
      ),
      Padding(
        child: TextField(
          decoration: InputDecoration(labelText: "Price"),
          controller: amountController,
          keyboardType: TextInputType.number,
          // onChanged: (val) => amountInput = val,
        ),
        padding: EdgeInsets.all(10),
      ),
      ElevatedButton(
          child: Text("Add Transaction"),
          onPressed: () {
            print(
                "Add expense: ${titleController.text} - ${amountController.text}");
            addNewTransaction(
              titleController.text,
              Decimal.parse(amountController.text),
            );
          })
    ]);
  }
}
