import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_flutter/screen/SocialWalkThrough.dart';
import 'package:social_flutter/utils/AppWidget.dart';

class SocialSplashScreen extends StatefulWidget {
  @override
  _SocialSplashScreenState createState() => _SocialSplashScreenState();
}

class _SocialSplashScreenState extends State<SocialSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await 3.seconds.delay.then((value) => push(SocialWalkThrough(), pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonCacheImageWidget("images/social/app_logo.png", height: 250, width: 250),
          ],
        ).withWidth(context.width()),
      ),
    );
  }
}
