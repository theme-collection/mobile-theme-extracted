import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

import '../../../main.dart';

class SNSettingScreen extends StatefulWidget {
  static String tag = '/SNSettingScreen';

  @override
  SNSettingScreenState createState() => SNSettingScreenState();
}

class SNSettingScreenState extends State<SNSettingScreen> {
  var searchCont = TextEditingController();
  List<SNSettingModel> settingList = getSettingItemList();

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
    void addAccount(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: appStore.scaffoldBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (builder) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 50,
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey, borderRadius: BorderRadius.circular(2)),
                ),
                16.height,
                Text('Add Account', style: boldTextStyle()),
                16.height,
                Divider(height: 0.5, color: appDividerColor),
                16.height,
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(5), boxShadow: defaultBoxShadow()),
                  child: Text('Log In to Existing Account', style: boldTextStyle(color: white)),
                ).onTap(() {
                  finish(context);
                }),
                16.height,
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  child: Text('Create New Account', style: boldTextStyle(color: Colors.blueAccent)),
                ).onTap(() {
                  finish(context);
                }),
              ],
            ).paddingAll(8),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Settings') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: searchCont,
                  style: primaryTextStyle(),
                  cursorColor: appStore.textPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: secondaryTextStyle(),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: appDividerColor)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appDividerColor)),
                    border: UnderlineInputBorder(borderSide: BorderSide(color: appDividerColor)),
                    prefixIcon: Icon(Icons.search, color: appStore.iconColor),
                  ),
                ),
                16.height,
                ListView.builder(
                  itemCount: settingList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    SNSettingModel data = settingList[i];
                    return SettingWidget(data: data).onTap(() {
                      if (data.screenWidget != null) {
                        data.screenWidget.launch(context);
                      }
                    });
                  },
                ),
                16.height,
                Row(
                  children: [
                    Text('FACEBOOK', style: boldTextStyle(size: 18)),
                    4.width,
                    Icon(MaterialCommunityIcons.facebook, size: 15),
                    4.width,
                    Icon(MaterialCommunityIcons.facebook_messenger, size: 15),
                    4.width,
                    Icon(AntDesign.instagram, size: 15),
                    4.width,
                    Icon(FontAwesome.whatsapp, size: 15),
                  ],
                ).paddingAll(8),
                8.height,
                Text('Account Centre', style: boldTextStyle(color: Colors.blueAccent)),
                16.height,
                Text(
                    'Control settings for connected experiences across Instagram, the Facebook app and Messenger, '
                    'including story and post sharing and logging in',
                    style: secondaryTextStyle(size: 14)),
                16.height,
                Text('Logins', style: boldTextStyle(size: 18)).onTap(() {}),
                16.height,
                Text('Multi-account login', style: boldTextStyle(size: 18)).onTap(() {}),
                16.height,
                Text('Add Account', style: boldTextStyle(size: 18, color: Colors.blueAccent)).onTap(() {
                  addAccount(context);
                }),
                16.height,
                Text('Log out', style: boldTextStyle(size: 18, color: Colors.blueAccent)).onTap(() {
                  logoutAlertDialogBox(context);
                }),
                16.height,
              ],
            ).paddingAll(8),
          ),
        ),
      ),
    );
  }
}
