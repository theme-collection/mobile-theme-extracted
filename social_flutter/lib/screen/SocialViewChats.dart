import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_flutter/model/SocialModel.dart';
import 'package:social_flutter/utils/AppWidget.dart';
import 'package:social_flutter/utils/SocialColors.dart';
import 'package:social_flutter/utils/SocialConstant.dart';
import 'package:social_flutter/utils/SocialDataGenerator.dart';
import 'package:social_flutter/utils/SocialWidget.dart';

import 'SocialHomeChats.dart';

class SocialViewChat extends StatefulWidget {
  static String tag = '/SocialViewChat';

  @override
  SocialViewChatState createState() => SocialViewChatState();
}

class SocialViewChatState extends State<SocialViewChat> {
  late List<SocialUser> mList;

  @override
  void initState() {
    super.initState();
    mList = addSeeMoreData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(social_white);
    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, ""),
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              decoration: boxDecoration(radius: spacing_middle),
              padding: EdgeInsets.all(spacing_middle),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Chats(mList[index], index);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
