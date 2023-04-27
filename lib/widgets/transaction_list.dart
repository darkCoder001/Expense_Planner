import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../models/transaction.dart';
import "package:intl/intl.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
        child: transactions.isEmpty ? Column(children: [
          Text("No Transactions added yet!", style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 10,),
          Container(height: 200,child: Image.asset('assets/images/waiting.gif', fit: BoxFit.cover,),),
        ],) :  ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(child: Row(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15,), 
                    child: Text(
                      "₹${transactions[index].amount.toStringAsFixed(2)}", 
                      style: Theme.of(context).textTheme.titleLarge,),
                    decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColorDark, width: 2, style: BorderStyle.solid )),
                    padding: EdgeInsets.all(10),
                    ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(transactions[index].title, style: Theme.of(context).textTheme.titleLarge ,),
                    Text(DateFormat.yMMMd().format(transactions[index].date), style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),)
                  ],)
                ]),);
 
          },
          itemCount: transactions.length,

        )
    );           
  }
}