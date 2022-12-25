import 'package:ema/widgets/horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }
  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Dashboard"
        ),
      ),
      body: Column(
        children: <Widget>[
          HorizontalCard(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: Text((index+1).toString()),
                      trailing: Text(
                        "9999 PKR",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("Expense - $index"));
                },
            ),
          ),
        ],
      ),
    );
  }
}
