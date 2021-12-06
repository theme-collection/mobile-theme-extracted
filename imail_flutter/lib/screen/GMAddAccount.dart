import 'package:flutter/material.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:imail_flutter/utils/GMImages.dart';
import 'package:nb_utils/nb_utils.dart';

class GMAddAccount extends StatefulWidget {
  @override
  _GMAddAccountState createState() => _GMAddAccountState();
}

class _GMAddAccountState extends State<GMAddAccount> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(GMMailIcon, height: 35, width: 35),
            16.height,
            Text('Set up email', style: primaryTextStyle(color: GMBlackColor, size: 22)),
            16.height,
            Divider(color: GMAppDividerColor),
            4.height,
            Row(
              children: [
                Image.asset(GMGoogle, height: 25, width: 25),
                16.width,
                Text('Google', style: primaryTextStyle(color: GMBlackColor, size: 16)),
              ],
            ),
            4.height,
            Divider(color: GMAppDividerColor),
            4.height,
            Row(
              children: [
                Image.asset(GMOutlook, height: 25, width: 25),
                16.width,
                Text('Outlook, Hotmail and Live', style: primaryTextStyle(color: GMBlackColor, size: 16)),
              ],
            ),
            4.height,
            Divider(color: GMAppDividerColor),
            4.height,
            Row(
              children: [
                Image.asset(GMMail, height: 25, width: 25, color: GMBlueColor),
                16.width,
                Text('Yahoo', style: primaryTextStyle(color: GMBlackColor, size: 16)),
              ],
            ),
            4.height,
            Divider(color: GMAppDividerColor),
            4.height,
            Row(
              children: [
                Image.asset(GMExchange, height: 25, width: 25),
                16.width,
                Text('Exchange and office 365', style: primaryTextStyle(color: GMBlackColor, size: 16)),
              ],
            ),
            4.height,
            Divider(color: GMAppDividerColor),
            4.height,
            Row(
              children: [
                Image.asset(GMMail, height: 25, width: 25, color: GMGreyColor),
                16.width,
                Text('Other', style: primaryTextStyle(color: GMBlackColor, size: 16)),
              ],
            ),
            4.height,
            Divider(color: GMAppDividerColor),
          ],
        ),
      ),
    );
  }
}
