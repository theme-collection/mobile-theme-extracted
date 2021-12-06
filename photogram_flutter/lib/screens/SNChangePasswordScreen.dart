import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/main.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';

class SNChangePasswordScreen extends StatefulWidget {
  static String tag = '/SNChangePasswordScreen';

  @override
  SNChangePasswordScreenState createState() => SNChangePasswordScreenState();
}

class SNChangePasswordScreenState extends State<SNChangePasswordScreen> {
  var passwordCont = TextEditingController();
  var newPasswordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();

  var newPasswordFocus = FocusNode();
  var confirmPasswordFocus = FocusNode();

  bool passwordObscureText = true;
  bool newPasswordObscureText = true;
  bool confirmPasswordObscureText = true;

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
        appBar: appBar(
          context,
          'Change password',
          actions: [
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  finish(context);
                })
          ],
        ) as PreferredSizeWidget?,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              TextFormField(
                obscureText: passwordObscureText,
                controller: passwordCont,
                cursorColor: appStore.textPrimaryColor,
                style: primaryTextStyle(size: 12),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  hintText: 'Current password',
                  hintStyle: secondaryTextStyle(size: 12),
                  filled: true,
                  fillColor: colorBackGround,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
                  suffix: Text(!passwordObscureText ? Hide : Show, style: boldTextStyle(size: 12)).onTap(() {
                    passwordObscureText = !passwordObscureText;
                    setState(() {});
                  }),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(newPasswordFocus),
                validator: (s) {
                  if (s!.trim().isEmpty) return errorThisFieldRequired;
                  return null;
                },
              ),
              8.height,
              TextFormField(
                obscureText: newPasswordObscureText,
                focusNode: newPasswordFocus,
                controller: newPasswordCont,
                cursorColor: appStore.textPrimaryColor,
                style: primaryTextStyle(size: 12),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  hintText: 'New password',
                  hintStyle: secondaryTextStyle(size: 12),
                  filled: true,
                  fillColor: colorBackGround,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
                  suffix: Text(!newPasswordObscureText ? Hide : Show, style: boldTextStyle(size: 12)).onTap(() {
                    newPasswordObscureText = !newPasswordObscureText;
                    setState(() {});
                  }),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(confirmPasswordFocus),
                validator: (s) {
                  if (s!.trim().isEmpty) return errorThisFieldRequired;
                  return null;
                },
              ),
              8.height,
              TextFormField(
                obscureText: confirmPasswordObscureText,
                focusNode: confirmPasswordFocus,
                controller: confirmPasswordCont,
                cursorColor: appStore.textPrimaryColor,
                style: primaryTextStyle(size: 12),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  hintText: 'Re-enter new password',
                  hintStyle: secondaryTextStyle(size: 12),
                  filled: true,
                  fillColor: colorBackGround,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
                  suffix: Text(!confirmPasswordObscureText ? Hide : Show, style: boldTextStyle(size: 12)).onTap(() {
                    confirmPasswordObscureText = !confirmPasswordObscureText;
                    setState(() {});
                  }),
                ),
                textInputAction: TextInputAction.done,
                validator: (s) {
                  if (s!.trim().isEmpty) return errorThisFieldRequired;
                  if (s.trim() != newPasswordCont.text) {
                    return 'password does not match';
                  }
                  return null;
                },
              ),
              8.height,
              createRichText(list: [
                TextSpan(
                  text: 'If you\'ve forgotten your password,you can ',
                  style: primaryTextStyle(size: 12, color: appStore.textSecondaryColor),
                ),
                TextSpan(text: 'reset it using Facebook', style: boldTextStyle(size: 12, color: fbColor)),
              ], maxLines: 2),
            ],
          ).onTap(() {}),
        ),
      ),
    );
  }
}
