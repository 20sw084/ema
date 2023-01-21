import 'package:ema/screens/dashboard.dart';
import 'package:ema/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

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
      home: Dashboard(),
    );
  }
}
