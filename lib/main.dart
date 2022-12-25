import 'package:flutter/material.dart';
import 'screens/my_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main(){
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp(),);
}
