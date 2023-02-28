import 'package:flutter/material.dart';
import '../provider/get_expense.dart';
import '../provider/get_income.dart';
import '../screens/add_screen.dart';

class HorizontalCard extends StatefulWidget {
  const HorizontalCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  late Future<dynamic> dataFutureIncome;
  late Future<dynamic> dataFutureExpense;
  @override
  void initState() {
    super.initState();
    dataFutureExpense = getExpense();
    dataFutureIncome = getIncome();
  }

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
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Income",
                      style: textStyle(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder(
                            future: dataFutureIncome,
                            builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }
                              else if(snapshot.hasData){
                                return Text(
                                  snapshot.data!.toString(),
                                  style: priceTextStyle(context),
                                );
                              }
                              else{
                                return Text("Error");
                              }
                            }
                        ),
                        Text(
                          " PKR",
                          style: priceTextStyle2(context),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddScreen(isIncome : true),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Expense",
                        style: textStyle(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder(
                            future: dataFutureExpense,
                            builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }
                              else if(snapshot.hasData){
                                 return Text(
                                  snapshot.data!.abs().toString(),
                                  style: priceTextStyle(context),
                                );
                              }
                              else{
                                return Text("Error");
                              }
                            }
                          ),
                          Text(
                            " PKR",
                            style: priceTextStyle2(context),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.add_circle_outline_rounded,
                          color: Colors.white,
                        ),
                        onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddScreen(isIncome : false),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static TextStyle textStyle(BuildContext context) {
    return const TextStyle(
      color: Colors.white,
      fontSize: 25,
    );
  }

  static TextStyle priceTextStyle(BuildContext context) {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 27,
    );
  }

  static TextStyle priceTextStyle2(BuildContext context) {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }
}
