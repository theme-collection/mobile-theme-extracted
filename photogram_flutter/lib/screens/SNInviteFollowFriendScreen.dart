import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

import '../../../main.dart';

class SNInviteFollowFriendScreen extends StatefulWidget {
  static String tag = '/SNInviteFollowFriendScreen';

  @override
  SNInviteFollowFriendScreenState createState() => SNInviteFollowFriendScreenState();
}

class SNInviteFollowFriendScreenState extends State<SNInviteFollowFriendScreen> {
  List<SNProfileSideDrawerModel> inviteList = getInviteFriendItem();

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
        appBar: appBar(context, 'Follow and Invite friends') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: inviteList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  SNProfileSideDrawerModel data = inviteList[i];
                  return GestureDetector(
                    onTap: () {},
                    child: options(text: data.name!, icon: data.icon, textColor: appStore.textPrimaryColor, iconColor: appStore.iconColor, showRightArrow: false),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
