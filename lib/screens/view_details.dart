import 'package:flutter/material.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("View Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0,),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ID",style: ts1(context),),
                    Text("0123456789",style: ts2(context),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("User Name",style: ts1(context),),
                    Text("Jonny",style: ts1(context),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount Name",style: ts1(context),),
                    Text("Expense h bro",style: ts1(context),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount Type",style: ts1(context),),
                    Text("Income",style: ts1(context),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount",style: ts1(context),),
                    Text("23456789",style: ts1(context),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Description",style: ts1(context),),
                    Text("buht bri h",style: ts1(context),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  static TextStyle ts1(BuildContext context) {
    return const TextStyle(
      fontSize: 25,
    );
  }

  static TextStyle ts2(BuildContext context) {
    return const TextStyle(
      fontSize: 25,
    );
  }
}
