import 'package:flix_app/screens/flix_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flix App',
      home: MuviSplashScreen(),
      debugShowCheckedModeBanner: false,
      builder: scrollBehaviour(),
    );
  }
}
