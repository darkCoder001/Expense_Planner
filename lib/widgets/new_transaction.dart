import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:flutter/material.dart";

class NewTransaction extends StatefulWidget {
   final Function addTx;

NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
   final titleController = TextEditingController();

   final amountController = TextEditingController();     

void submitData(){
  final enteredTitle =titleController.text;
  final eneteredAmount = double.parse(amountController.text);
  
  if(enteredTitle.isEmpty || eneteredAmount<=0){
    return;
  }

  widget.addTx(enteredTitle,eneteredAmount);

  Navigator.of(context).pop();
}

  @override
  Widget build(BuildContext context) {
    return Card(child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"), 
                controller: titleController,
                onSubmitted: (_) => submitData, 
                ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"), 
                controller: amountController, 
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData,
                ),
              TextButton(onPressed: submitData, 
              child: Text("Add Transaction", style: TextStyle(color: Theme.of(context).primaryColor),),)
            ]),
          ),);
  }
}