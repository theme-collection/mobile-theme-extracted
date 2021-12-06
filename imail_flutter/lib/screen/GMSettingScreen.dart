import 'package:flutter/material.dart';
import 'package:imail_flutter/screen/GMAddAccount.dart';
import 'package:imail_flutter/screen/GMGeneralSettings.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:nb_utils/nb_utils.dart';

class GMSettingScreen extends StatefulWidget {
  @override
  _GMSettingScreenState createState() => _GMSettingScreenState();
}

class _GMSettingScreenState extends State<GMSettingScreen> {
  List<String> settingList = ['General Settings', 'david12@gmail.com', 'denial33@gmail.com', 'Add account'];

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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: GMWhiteColor,
        title: Text(
          'Settings',
          style: boldTextStyle(size: 18),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (dynamic v) {},
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(PopupMenuItem(child: Text('Manage Accounts', style: primaryTextStyle()), value: 1));
              list.add(PopupMenuItem(child: Text('Help and feedback', style: primaryTextStyle()), value: 2));
              return list;
            },
          ).paddingTop(8)
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: settingList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 3) {
                  GMAddAccount().launch(context);
                } else if (index == 0) {
                  GMGeneralSettings().launch(context);
                }
              },
              child: Text(settingList[index], style: primaryTextStyle(size: 18)).paddingOnly(left: 16, right: 16, top: 16),
            );
          }),
    );
  }
}
