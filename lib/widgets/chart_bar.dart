import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spendPercent;

  ChartBar(this.label, this.spendAmount, this.spendPercent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 15,
        child: FittedBox(child: Text("₹${spendAmount.toStringAsFixed(0)}"))),
        SizedBox(height: 4,),
        Container(
          height: 80,
          width: 20,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
                ),
            ),
            FractionallySizedBox(
              heightFactor: spendPercent, 
              child: Container(decoration: 
              BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(10),
                ),
                ) 
            ,),
          ],),
        ),
        SizedBox(height: 4,),
        Text(label),
      ],
    );
  }
}