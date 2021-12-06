import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/main.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';

import 'SNConstants.dart';

Widget snAppBar(BuildContext context, {List<Widget>? actions, bool showBack = true, Color? color, Color? iconColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: false,
    backgroundColor: color ?? appStore.appBarColor,
    leading: showBack
        ? IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.arrow_back, color: iconColor ?? null),
          )
        : null,
    title: Text(SNAppName, style: primaryTextStyle(size: 32, fontFamily: fontBillabong, weight: FontWeight.w200)),
    actions: actions,
  );
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final SNMessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          margin: isMe.validate() ? EdgeInsets.only(top: 3.0, bottom: 3.0, right: 0, left: (context.width() * 0.25).toDouble()) : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 0, right: (context.width() * 0.25).toDouble()),
          decoration: BoxDecoration(
            /*color: !isMe ? appStore.appBarColor : ,*/
            gradient: LinearGradient(
              colors: !isMe
                  ? [appStore.appBarColor!, appStore.appBarColor!]
                  : [
                      getColorFromHex('#C13584'),
                      getColorFromHex('#833AB4'),
                    ],
            ),
            boxShadow: defaultBoxShadow(),
            borderRadius: isMe.validate()
                ? BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10), topRight: Radius.circular(10))
                : BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
            border: Border.all(color: isMe ? Theme.of(context).dividerColor : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Flexible(child: Text(data.msg!, style: primaryTextStyle(color: isMe ? white : appStore.textPrimaryColor))), Text(data.time!, style: secondaryTextStyle(color: isMe ? white : appStore.textSecondaryColor, size: 12))],
          ),
        ),
      ],
    );
  }
}

class SNCommonProfileField extends StatefulWidget {
  static String tag = '/SNCommonProfileField';

  final Widget? textFormField;
  final String? title;

  SNCommonProfileField({this.textFormField, this.title});

  @override
  SNCommonProfileFieldState createState() => SNCommonProfileFieldState();
}

class SNCommonProfileFieldState extends State<SNCommonProfileField> {
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
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                  child: Text(
                    widget.title!,
                    style: boldTextStyle(),
                    textAlign: TextAlign.end,
                  ),
                  alignment: Alignment.centerRight,
                  width: context.width() * 0.08),
              16.width,
              widget.textFormField!,
              16.width,
            ],
          ),
        ),
      ],
    );
  }
}

Widget options({required String text, IconData? icon, bool showRightArrow = true, Color? iconColor, Color? textColor}) {
  return Row(
    children: [
      Icon(icon, size: 25, color: iconColor ?? appStore.iconColor),
      12.width,
      Text(text, style: secondaryTextStyle(color: textColor ?? appStore.textSecondaryColor, size: 16)).expand(),
      Icon(Icons.chevron_right, size: 20, color: appStore.iconSecondaryColor).visible(showRightArrow),
    ],
  ).paddingAll(16);
}

void accounts(BuildContext aContext, List list) {
  showModalBottomSheet(
    context: aContext,
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
            ListView.builder(
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                SNAccountModel data = list[i];
                return Row(
                  children: [
                    Image.asset(data.profileImg!, height: 60, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                    16.width,
                    Text(data.name!, style: boldTextStyle(color: appStore.textSecondaryColor)).expand(),
                    Icon(
                      data.selected ? MaterialIcons.radio_button_checked : Feather.circle,
                      color: data.selected ? Colors.blueAccent : appStore.iconSecondaryColor,
                    )
                  ],
                ).onTap(() {
                  data.selected = !data.selected;
                  finish(context);
                });
              },
            ),
          ],
        ).paddingAll(8),
      );
    },
  );
}

void confirmationAlertBox(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CustomTheme(
            child: CupertinoAlertDialog(
              content: Text(
                'Log out $Username',
                style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    'Cancel',
                    style: primaryTextStyle(color: dodgerBlue, size: 18),
                  ),
                  onPressed: () {
                    finish(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    'Logout',
                    style: primaryTextStyle(color: redColor, size: 18),
                  ),
                  onPressed: () {
                    finish(context);
                  },
                )
              ],
            ),
          ));
}

void logoutAlertDialogBox(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CustomTheme(
            child: CupertinoAlertDialog(
              title: Text(
                'Remember login info',
                style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
              ),
              content: Text(
                'We\'ll remember the login info for $Username. You won\'t need to enter it when you log in again.',
                style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    'Not Now',
                    style: primaryTextStyle(color: appStore.textPrimaryColor, size: 18),
                  ),
                  onPressed: () {
                    finish(context);
                    confirmationAlertBox(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    'Remember',
                    style: primaryTextStyle(color: Colors.blueAccent, size: 18),
                  ),
                  onPressed: () {
                    finish(context);
                  },
                )
              ],
            ),
          ));
}

class SettingWidget extends StatelessWidget {
  static String tag = '/SettingWidget';

  final SNSettingModel? data;

  SettingWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(data!.icon!, height: 25, width: 25, color: appStore.iconColor),
          16.width,
          Text(data!.name!, style: primaryTextStyle()).expand(),
        ],
      ),
    );
  }
}
