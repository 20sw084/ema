import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../screens/add_screen.dart';

class HorizontalCard extends StatefulWidget {
  const HorizontalCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  Query databaseRef = FirebaseDatabase.instance.ref().child('budgetTree');
  int income = 0, expense = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 16,
        height: 150,
        child: Column(
          children: [
            Expanded(
              // flex: 0,
              child: StreamBuilder(
                stream: databaseRef.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  income = 0;
                  expense = 0;
                  if (snapshot.hasData) {
                    Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];
                    list.clear();
                    list = map.values.toList();
                    return ListView.builder(
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context, index) {
                        if (int.parse(list[index]['amount']) > 0) {
                          income += int.parse(list[index]["amount"]);
                        } else {
                          expense += int.parse(list[index]["amount"]);
                        }
                        return Container();
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  // flex: 2,
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
                          leading: Text(
                            income.toString(),
                            style: priceTextStyle(context),
                          ),
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
                              Text(
                                expense.abs().toString(),
                                style: priceTextStyle(context),
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
