import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/screens/SNBottomNavigationScreen.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';

import '../../../main.dart';
import 'SNDashboardScreen.dart';
import 'SNForgotPasswordScreen.dart';
import 'SNSignUpScreen.dart';

class SNSignInScreen extends StatefulWidget {
  static String tag = '/SNSignInScreen';

  @override
  SNSignInScreenState createState() => SNSignInScreenState();
}

class SNSignInScreenState extends State<SNSignInScreen> {
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;

  var emailCont = TextEditingController();
  var passCont = TextEditingController();

  var passFocus = FocusNode();

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
    Widget body() {
      return SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: context.width(),
                  padding: EdgeInsets.all(32),
                  decoration: boxDecoration(color: appDividerColor, radius: 5.0, bgColor: appStore.scaffoldBackground),
                  child: Column(
                    children: [
                      Text(SNAppName, style: primaryTextStyle(size: 50, fontFamily: fontBillabong, weight: FontWeight.w200)),
                      24.height,
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
                        onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(passFocus),
                        textInputAction: TextInputAction.next,
                      ),
                      8.height,
                      TextFormField(
                        obscureText: obscureText,
                        focusNode: passFocus,
                        controller: passCont,
                        cursorColor: appStore.textPrimaryColor,
                        style: primaryTextStyle(size: 12),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8, right: 8),
                          hintText: passwordHintText,
                          hintStyle: secondaryTextStyle(size: 12),
                          filled: true,
                          fillColor: colorBackGround,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
                          suffix: Text(!obscureText ? Hide : Show, style: boldTextStyle(size: 12)).onTap(() {
                            obscureText = !obscureText;
                            setState(() {});
                          }),
                        ),
                        validator: (s) {
                          if (s!.trim().isEmpty) return errorThisFieldRequired;
                          return null;
                        },
                      ),
                      16.height,
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: colorBlue, borderRadius: BorderRadius.circular(5), boxShadow: defaultBoxShadow()),
                        child: Text(Login, style: primaryTextStyle(color: white)),
                      ).onTap(() {
                        isMobile ? SNBottomNavigationScreen().launch(context) : SNDashboardScreen().launch(context);
                      }),
                      16.height,
                      Row(
                        children: [
                          Divider(height: 0.5, color: appDividerColor).expand(),
                          Text(or, style: boldTextStyle(color: grey, size: 16)).paddingOnly(left: 8, right: 8),
                          Divider(height: 0.5, color: appDividerColor).expand(),
                        ],
                      ),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(AntDesign.facebook_square, color: fbColor),
                          8.width,
                          Text(
                            loginWithFb,
                            style: boldTextStyle(color: fbColor),
                          )
                        ],
                      ).onTap(() {}),
                      8.height,
                      Text(forgotPassword, style: primaryTextStyle(size: 12, color: fbColor)).onTap(() {
                        SNForgotPasswordScreen().launch(context);
                      })
                    ],
                  ),
                ),
                8.height,
                Container(
                  width: context.width(),
                  padding: EdgeInsets.all(20),
                  decoration: boxDecoration(color: appDividerColor, radius: 5.0, bgColor: appStore.scaffoldBackground),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(do_ntHaveAccount, style: primaryTextStyle()),
                      Text(signUp, style: boldTextStyle(color: colorBlue, size: 16)),
                    ],
                  ).onTap(() {
                    finish(context);
                    SNSignUpScreen().launch(context);
                  }),
                ),
              ],
            ),
          ),
        ),
      ).center();
    }

    return Scaffold(
      backgroundColor: colorBackGround,
      body: Container(
        child: body(),
      ),
    );
  }
}
