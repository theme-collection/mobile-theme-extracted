import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';

import 'SNSignInScreen.dart';

class SNSplashScreen extends StatefulWidget {
  static String tag = '/SNSplashScreen';

  @override
  SNSplashScreenState createState() => SNSplashScreenState();
}

class SNSplashScreenState extends State<SNSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(Duration(seconds: 2));
    finish(context);
    SNSignInScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    //changeStatusColor(colorBackGround);

    return Scaffold(
      backgroundColor: colorBackGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/socialNetwork/app_ic_photogram.png", height: 60, width: 60),
          8.height,
          Text(SNAppName, style: boldTextStyle(size: 25)),
        ],
      ).center(),
    );
  }
}
