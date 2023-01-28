import 'dart:developer';

import 'package:ema/provider/amount_provider.dart';
import 'package:ema/screens/dashboard.dart';
import 'package:ema/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String name = '';
 @override
  void initState() {
   getName();
    // TODO: implement initState
    super.initState();
  }
  void getName() async{
   SharedPreferences sp = await SharedPreferences.getInstance();
   name = sp.getString('name') ?? 'empty';
   log(name.toString());
  }
  @override
  Widget build(BuildContext context) {
     if(name == 'empty') {
       return ChangeNotifierProvider(
         create: (_) => AmountProvider(),
           child: const OnboardingScreen(),
       );
     }
     else {
       return ChangeNotifierProvider(
         create: (_) => AmountProvider(),
         child: Dashboard(),
       );
       // return const Dashboard();
     }
  }
}
