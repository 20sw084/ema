import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ema/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/amount_provider.dart';
import '../screens/add_screen.dart';

class HorizontalCard extends StatefulWidget {
  HorizontalCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final amountProvider = Provider.of<AmountProvider>(context);
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
                      leading: Text(
                        amountProvider.getIncome().toString(),
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
                          Text(
                            amountProvider.getExpense().abs().toString(),
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
