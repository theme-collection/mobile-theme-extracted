import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';

class SNNotificationScreen extends StatefulWidget {
  static String tag = '/SNNotificationScreen';

  @override
  SNNotificationScreenState createState() => SNNotificationScreenState();
}

class SNNotificationScreenState extends State<SNNotificationScreen> {
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Notification') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Push Notification', style: boldTextStyle()),
                8.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pause All', style: primaryTextStyle()),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.blueAccent,
                      activeColor: Colors.white,
                    ),
                  ],
                ),
                16.height,
                Text('Post, Stories and Comments', style: primaryTextStyle()),
                20.height,
                Text('Following and Followers', style: primaryTextStyle()),
                20.height,
                Text('Direct Messages', style: primaryTextStyle()),
                20.height,
                Text('Live and IGTV', style: primaryTextStyle()),
                20.height,
                Text('From Instagram', style: primaryTextStyle()),
                20.height,
                Divider(height: 0.5, color: appDividerColor),
                20.height,
                Text('Other Notification Types', style: primaryTextStyle()),
                20.height,
                Text('Email and SMS', style: primaryTextStyle()),
              ],
            ).paddingAll(8),
          ),
        ),
      ),
    );
  }
}
