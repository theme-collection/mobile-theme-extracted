import 'package:flutter/material.dart';
import 'package:imail_flutter/screen/GMDashboardScreen.dart';
import 'package:imail_flutter/utils/GMConstants.dart';
import 'package:nb_utils/nb_utils.dart';

class GMSplashScreen extends StatefulWidget {
  static String tag = '/GMSplashScreen';

  @override
  GMSplashScreenState createState() => GMSplashScreenState();
}

class GMSplashScreenState extends State<GMSplashScreen> {
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
    GMDashboardScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorFromHex('#FFFFFF'),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset("images/gmail/app_ic_gm.png", height: 150, width: 150).center(),
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('From', style: secondaryTextStyle()),
                Text(GMAppName, style: boldTextStyle(size: 25, color: Colors.black)),
              ],
            ).paddingBottom(16),
          )
        ],
      ),
    );
  }
}
