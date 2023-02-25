import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/amount_provider.dart';
import '../provider/get_expense.dart';
import '../screens/add_screen.dart';

class HorizontalCard extends StatefulWidget {
  const HorizontalCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  late Future<dynamic> dataFutureExpense;
  @override
  void initState() {
    super.initState();
    dataFutureExpense = getExpense().whenComplete(() {setState(() {
      
    });});
    // log(dataFuture.toString());
  }

  @override
  Widget build(BuildContext context) {
    final amountProvider = Provider.of<AmountProvider>(context, listen: true);
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
                    ListTile(
                      leading: Consumer<AmountProvider>(
                          builder: (context, value, child) {
                        return Text(
                          12.toString(),
                          // value.getIncome().toString(),
                          style: priceTextStyle(context),
                        );
                      }),
                      // Text(
                      //   amountProvider.getIncome().toString(),
                      //   style: priceTextStyle(context),
                      // ),
                      trailing: Text(
                        " PKR",
                        style: priceTextStyle2(context),
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                      ),
                      onTap: () {
                        // setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddScreen(),
                          ),
                        );
                        // });
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
                          // amountProvider.setExpense();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddScreen(),
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
