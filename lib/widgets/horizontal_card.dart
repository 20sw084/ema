import 'package:ema/screens/add_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatefulWidget {
  int income = 0, expense = 0;
  HorizontalCard({Key? key, required this.income, required this.expense}) : super(key: key);

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  Query databaseRef = FirebaseDatabase.instance.ref('budgetTree').orderByChild("amount");
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 16,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // FirebaseAnimatedList(
            //   // shrinkWrap: true,
            //   query: databaseRef,
            //   itemBuilder: (BuildContext context, DataSnapshot snapshot,
            //       Animation<double> animation, int index) {
            //     Map _budget = snapshot.value as Map;
            //     _budget['key'] = snapshot.key;
            //     if(int.parse(_budget["amount"]) > 0){
            //       income += int.parse(_budget["amount"]);
            //     }
            //     else{
            //       expense += int.parse(_budget["amount"]);
            //     }
            //     return SizedBox();
            //   },
            // ),
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Income", style: textStyle(context),),
                  Text("${widget.income.toString()} PKR", style: priceTextStyle(context),),
                  GestureDetector(
                    child: const Icon(Icons.add_circle_outline_rounded,color: Colors.white,),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddScreen(),),);
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Expense", style: textStyle(context),),
                  Text(
                    "${widget.expense.toString()} PKR", style: priceTextStyle(context),),
                  GestureDetector(
                    child: const Icon(Icons.add_circle_outline_rounded,color: Colors.white,),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddScreen(),),);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static TextStyle textStyle (BuildContext context){
    return const TextStyle(
      color: Colors.white,
      fontSize: 30,
    );
  }

  static TextStyle priceTextStyle (BuildContext context){
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    );
  }

}