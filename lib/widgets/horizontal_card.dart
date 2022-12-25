import 'package:ema/screens/add_screen.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatefulWidget {
  const HorizontalCard({Key? key}) : super(key: key);

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
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
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Income", style: textStyle(context),),
                  Text("10000 PKR", style: priceTextStyle(context),),
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
                  Text("10000 PKR", style: priceTextStyle(context),),
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