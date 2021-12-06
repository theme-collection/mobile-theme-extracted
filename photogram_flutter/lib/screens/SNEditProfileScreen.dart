import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/components/ChangePasswordComponent.dart';
import 'package:photogram_flutter/components/EditProfileComponent.dart';
import 'package:photogram_flutter/components/EmailSMSComponent.dart';
import 'package:photogram_flutter/main.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNImages.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

class SNEditProfileScreen extends StatefulWidget {
  static String tag = '/SNEditProfileScreen';

  @override
  SNEditProfileScreenState createState() => SNEditProfileScreenState();
}

class SNEditProfileScreenState extends State<SNEditProfileScreen> {
  List<SNEditProfileModel> list = getEditProfileOptionList();
  int selectedIndex = 0;

  var nameCont = TextEditingController();
  var userCont = TextEditingController();
  var websiteCont = TextEditingController();
  var bioCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    nameCont.text = 'Smith John';
    userCont.text = 'Smith_John0667';
    bioCont.text = '🚶KN:24 🚶cricket love🏏';
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget editProfileOptionList() {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          SNEditProfileModel data = list[i];
          return GestureDetector(
            onTap: () {
              selectedIndex = i;
              setState(() {});
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 3, height: 50, color: Colors.transparent),
                16.width,
                Expanded(
                  child: Text(
                    data.title!,
                    style: secondaryTextStyle(color: appStore.textSecondaryColor, size: 16),
                  ).paddingOnly(top: 16, bottom: 16),
                ),
              ],
            ).paddingOnly(bottom: 8),
          );
        },
      );
    }

    Widget webWidget() {
      return SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          width: context.width() * 0.6,
          height: context.height(),
          decoration: boxDecoration(color: appDividerColor, radius: 5.0, bgColor: appStore.scaffoldBackground),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editProfileOptionList().expand(flex: 2),
              VerticalDivider(color: appDividerColor, thickness: 0.5),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.only(top: 16),
                      child: EditProfileComponent(),
                    ).visible(selectedIndex == 0),
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.only(top: 16),
                      child: ChangePasswordComponent(),
                    ).visible(selectedIndex == 1),
                    Container(
                      color: Colors.yellowAccent,
                      width: context.width(),
                    ).visible(selectedIndex == 2),
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.only(top: 16),
                      child: EmailSMSComponent(),
                    ).visible(selectedIndex == 3),
                    Container(
                      color: Colors.greenAccent,
                      width: context.width(),
                    ).visible(selectedIndex == 4),
                    Container(
                      color: Colors.blueAccent,
                      width: context.width(),
                    ).visible(selectedIndex == 5),
                    Container(
                      color: Colors.black12,
                      width: context.width(),
                    ).visible(selectedIndex == 6),
                    Container(
                      color: Colors.deepOrange,
                      width: context.width(),
                    ).visible(selectedIndex == 7),
                    Container(
                      color: Colors.indigo,
                      width: context.width(),
                    ).visible(selectedIndex == 8),
                  ],
                ),
              ).expand(flex: 7)
            ],
          ),
        ),
      ).center();
    }

    Widget mobileWidget() {
      return SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            16.height,
            CircleAvatar(backgroundImage: AssetImage(SNUser1), radius: 60).center(),
            8.height,
            Text('Change Profile photo', style: boldTextStyle(size: 18, color: Colors.blueAccent)),
            16.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name', style: secondaryTextStyle()),
                TextFormField(
                  controller: nameCont,
                  style: primaryTextStyle(),
                  cursorColor: appStore.textPrimaryColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8, right: 8),
                    hintStyle: secondaryTextStyle(size: 12),
                    hintText: 'Name',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                ),
                8.height,
                Text('UserName', style: secondaryTextStyle()),
                TextFormField(
                  controller: userCont,
                  style: primaryTextStyle(),
                  cursorColor: appStore.textPrimaryColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8, right: 8),
                    hintStyle: secondaryTextStyle(size: 12),
                    hintText: 'UserName',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                ),
                8.height,
                Text('Website', style: secondaryTextStyle()),
                TextFormField(
                  controller: websiteCont,
                  style: primaryTextStyle(),
                  cursorColor: appStore.textPrimaryColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8, right: 8),
                    hintStyle: secondaryTextStyle(size: 12),
                    hintText: 'Website',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                ),
                8.height,
                8.height,
                Text('Bio', style: secondaryTextStyle()),
                TextFormField(
                  controller: bioCont,
                  style: primaryTextStyle(),
                  cursorColor: appStore.textPrimaryColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8, right: 8),
                    hintStyle: secondaryTextStyle(size: 12),
                  ),
                  keyboardType: TextInputType.multiline,
                  validator: (s) {
                    if (s!.trim().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                ),
                16.height,
                Divider(height: 0.5, color: appDividerColor),
                Text('Switch to Professional account', style: primaryTextStyle(color: Colors.blueAccent)).paddingOnly(top: 16, bottom: 16),
                Divider(height: 0.5, color: appDividerColor),
                16.height,
                Divider(height: 0.5, color: appDividerColor),
                Text('Switch to Professional account', style: primaryTextStyle(color: Colors.blueAccent)).paddingOnly(top: 16, bottom: 16),
                Divider(height: 0.5, color: appDividerColor)
              ],
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: isMobile
            ? appBar(
                context,
                'Edit profile',
                actions: [
                  IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        finish(context);
                      })
                ],
              ) as PreferredSizeWidget?
            : snAppBar(context, showBack: true) as PreferredSizeWidget?,
        body: Responsive(
          web: webWidget(),
          mobile: mobileWidget(),
        ),
      ),
    );
  }
}
