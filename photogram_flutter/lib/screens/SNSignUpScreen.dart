import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/main.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';

class SNSignUpScreen extends StatefulWidget {
  static String tag = '/SNSignUpScreen';

  @override
  SNSignUpScreenState createState() => SNSignUpScreenState();
}

class SNSignUpScreenState extends State<SNSignUpScreen> {
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;

  var emailCont = TextEditingController();
  var fullNameCont = TextEditingController();
  var userCont = TextEditingController();
  var passCont = TextEditingController();

  var fullNameFocus = FocusNode();
  var userFocus = FocusNode();
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
                      Text(signUpSubTitle, style: secondaryTextStyle(), textAlign: TextAlign.center),
                      16.height,
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: boxDecoration(bgColor: colorBlue, radius: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(AntDesign.facebook_square, color: white), 8.width, Text(loginWithFb, style: boldTextStyle(color: white))],
                        ).onTap(() {}),
                      ),
                      16.height,
                      Row(
                        children: [
                          Divider(height: 0.5, color: appDividerColor).expand(),
                          Text(or, style: boldTextStyle(color: grey, size: 16)).paddingOnly(left: 8, right: 8),
                          Divider(height: 0.5, color: appDividerColor).expand(),
                        ],
                      ),
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
                        onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(fullNameFocus),
                        textInputAction: TextInputAction.next,
                      ),
                      8.height,
                      TextFormField(
                        controller: fullNameCont,
                        focusNode: fullNameFocus,
                        style: primaryTextStyle(size: 12),
                        cursorColor: appStore.textPrimaryColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8, right: 8),
                          hintStyle: secondaryTextStyle(size: 12),
                          hintText: fullNameHintText,
                          filled: true,
                          fillColor: colorBackGround,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (s) {
                          if (s!.trim().isEmpty) return errorThisFieldRequired;
                          return null;
                        },
                        onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(userFocus),
                        textInputAction: TextInputAction.next,
                      ),
                      8.height,
                      TextFormField(
                        controller: userCont,
                        focusNode: userFocus,
                        style: primaryTextStyle(size: 12),
                        cursorColor: appStore.textPrimaryColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8, right: 8),
                          hintStyle: secondaryTextStyle(size: 12),
                          hintText: usernameHintText,
                          filled: true,
                          fillColor: colorBackGround,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
                        ),
                        keyboardType: TextInputType.name,
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
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: colorBackGround,
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
                        child: Text(signUp, style: primaryTextStyle(color: white)),
                      ).onTap(() {
                        finish(context);
                      }),
                      16.height,
                      createRichText(list: [
                        TextSpan(
                          text: 'By signning up, you agree to our ',
                          style: primaryTextStyle(size: 12, color: appStore.textSecondaryColor),
                        ),
                        TextSpan(text: ' Terms  Data policy ', style: boldTextStyle(size: 12, color: appStore.textSecondaryColor)),
                        TextSpan(text: 'and', style: primaryTextStyle(size: 12, color: appStore.textSecondaryColor)),
                        TextSpan(text: ', cookies policy', style: boldTextStyle(size: 12, color: appStore.textSecondaryColor)),
                      ], maxLines: 3, textAlign: TextAlign.center),
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
                      Text('Have an account?', style: primaryTextStyle()),
                      Text(' Log in', style: boldTextStyle(color: colorBlue, size: 16)),
                    ],
                  ).onTap(() {
                    finish(context);
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
