import 'package:flutter/material.dart';
import 'package:news_blog/screen/NBSplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Blog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NBSplashScreen(),
    );
  }
}
