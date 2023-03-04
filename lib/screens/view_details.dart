import 'package:ema/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
// TODO: PIE Chart
class ViewDetails extends StatefulWidget {
  String id = '',
      uName = '',
      aName = '',
      aType = '',
      amount = '',
      desc = '',
      date = '';

  ViewDetails({
    Key? key,
    required this.id,
    required this.uName,
    required this.aName,
    required this.aType,
    required this.amount,
    required this.desc,
    required this.date,
  }) : super(key: key);

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
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
                      style: Utils.ts1(context),
                    ),
                    Text(
                      widget.id,
                      style: Utils.ts1(context),
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
                      style: Utils.ts1(context),
                    ),
                    Text(
                      widget.uName,
                      style: Utils.ts1(context),
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
                      style: Utils.ts1(context),
                    ),
                    Text(
                      widget.aName,
                      style: Utils.ts1(context),
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
                      style: Utils.ts1(context),
                    ),
                    Text(
                      int.parse(widget.amount) > 0 ? "Income" : "Expense",
                      style: Utils.ts1(context),
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
                      style: Utils.ts1(context),
                    ),
                    Text(
                      widget.amount,
                      style: Utils.ts1(context),
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
                      "Date Time",
                      style: Utils.ts1(context),
                    ),
                    Text(
                      widget.date,
                      style: Utils.ts1(context),
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
                      style: Utils.ts1(context),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ReadMoreText(
                        widget.desc,
                        style: Utils.ts1(context),
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                      ),
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
