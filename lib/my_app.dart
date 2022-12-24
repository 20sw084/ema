import 'package:ema/dashboard.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // primarySwatch: Color.fromARGB(100, 245, 166, 240),
      ),
      home: Dashboard(),
    );
  }
}
