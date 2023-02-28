import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  String id = '', uName = '', aName = '', aType = '', amount = '', desc = '';

  ViewDetails(
      {Key? key,
      required this.id,
      required this.uName,
      required this.aName,
      required this.aType,
      required this.amount,
      required this.desc})
      : super(key: key);

  @override
  State<ViewDetails> createState() => _ViewDetailsState();

  static TextStyle ts1(BuildContext context) {
    return const TextStyle(
      fontSize: 20,
    );
  }

  static TextStyle ts2(BuildContext context) {
    return const TextStyle(
      fontSize: 20,
    );
  }
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("View Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ID",
                      style: ViewDetails.ts1(context),
                    ),
                    Text(
                      widget.id,
                      style: ViewDetails.ts2(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User Name",
                      style: ViewDetails.ts1(context),
                    ),
                    Text(
                      widget.uName,
                      style: ViewDetails.ts1(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount Name",
                      style: ViewDetails.ts1(context),
                    ),
                    Text(
                      widget.aName,
                      style: ViewDetails.ts1(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount Type",
                      style: ViewDetails.ts1(context),
                    ),
                    Text(
                        int.parse(widget.amount) > 0 ? "Income" : "Expense",
                      style: ViewDetails.ts1(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount",
                      style: ViewDetails.ts1(context),
                    ),
                    Text(
                      widget.amount,
                      style: ViewDetails.ts1(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description",
                      style: ViewDetails.ts1(context),
                    ),
                    Text(
                      widget.desc,
                      style: ViewDetails.ts1(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
