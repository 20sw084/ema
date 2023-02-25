import 'package:flutter/material.dart';
import '../wrapper.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: OnboardingScreen(),
      home: Wrapper(),
    );
  }
}
