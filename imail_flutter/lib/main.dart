import 'package:flutter/material.dart';
import 'package:imail_flutter/model/GMModel.dart';
import 'package:imail_flutter/screen/GMSplashScreen.dart';

List<GMMailModel?> snoozingList = [];
bool isMultiSelect = false;
GlobalKey<ScaffoldState> drawerKey = GlobalKey();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imail flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GMSplashScreen(),
    );
  }
}
