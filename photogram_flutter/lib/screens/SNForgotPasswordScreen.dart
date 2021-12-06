import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/screens/SNSignUpScreen.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNImages.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

import '../../../main.dart';

class SNForgotPasswordScreen extends StatefulWidget {
  static String tag = '/SNForgotPasswordScreen';

  @override
  SNForgotPasswordScreenState createState() => SNForgotPasswordScreenState();
}

class SNForgotPasswordScreenState extends State<SNForgotPasswordScreen> {
  var emailCont = TextEditingController();

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
    return Scaffold(
      backgroundColor: colorBackGround,
      appBar: snAppBar(context) as PreferredSizeWidget?,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Center(
          child: Column(
            children: [
              Container(
                height: context.height() * 0.7,
                width: context.width(),
                decoration: boxDecoration(color: appDividerColor, radius: 5.0, bgColor: appStore.scaffoldBackground),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(SN_icLock, height: 80, width: 80, color: appStore.iconColor),
                        8.height,
                        Text(troubleLogin, style: primaryTextStyle(size: 18)),
                        16.height,
                        Text(forgotSubTitle, style: secondaryTextStyle(size: 14), maxLines: 3, textAlign: TextAlign.center),
                        16.height,
                        TextFormField(
                          controller: emailCont,
                          style: primaryTextStyle(size: 12),
                          cursorColor: appStore.textPrimaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8, right: 8),
                            hintStyle: secondaryTextStyle(size: 12),
                            hintText: emailHintText,
                            filled: true,
                            fillColor: colorBackGround,
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (s) {
                            if (s!.trim().isEmpty) return errorThisFieldRequired;
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                        ),
                        16.height,
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(color: colorBlue, borderRadius: BorderRadius.circular(5), boxShadow: defaultBoxShadow()),
                          child: Text(sendLoginLink, style: primaryTextStyle(color: white)),
                        ).onTap(() {}),
                        24.height,
                        Row(
                          children: [
                            Divider(height: 0.5, color: appDividerColor).expand(),
                            Text(or, style: boldTextStyle(color: grey, size: 16)).paddingOnly(left: 8, right: 8),
                            Divider(height: 0.5, color: appDividerColor).expand(),
                          ],
                        ),
                        16.height,
                        Text(createAccount, style: boldTextStyle(size: 14)).onTap(() {
                          SNSignUpScreen().launch(context);
                        }),
                      ],
                    ).paddingAll(32),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.center,
                        width: context.width(),
                        height: 50,
                        padding: EdgeInsets.all(8),
                        decoration: boxDecoration(color: appDividerColor, radius: 5.0, bgColor: colorBackGround),
                        child: Text(BackToLogin, style: primaryTextStyle()).onTap(() {
                          finish(context);
                        }),
                      ).onTap(() {}),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
