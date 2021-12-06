import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNImages.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

import '../../../main.dart';

class ChangePasswordComponent extends StatefulWidget {
  static String tag = '/ChangePasswordComponent';

  @override
  ChangePasswordComponentState createState() => ChangePasswordComponentState();
}

class ChangePasswordComponentState extends State<ChangePasswordComponent> {
  var oldPasswordCont = TextEditingController();
  var newPasswordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();

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
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                SNUser3,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(30),
              16.width,
              Text(Username, style: primaryTextStyle(size: 18)),
            ],
          ),
          24.height,
          SNCommonProfileField(
            title: Old_Password,
            textFormField: TextFormField(
              controller: oldPasswordCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: Old_Password,
                hintStyle: secondaryTextStyle(),
                filled: true,
                fillColor: colorBackGround,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
              ),
              validator: (s) {
                if (s!.trim().isEmpty) return errorThisFieldRequired;
                return null;
              },
            ).expand(),
          ),
          8.height,
          SNCommonProfileField(
            title: New_Password,
            textFormField: TextFormField(
              controller: oldPasswordCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: New_Password,
                hintStyle: secondaryTextStyle(),
                filled: true,
                fillColor: colorBackGround,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
              ),
              validator: (s) {
                if (s!.trim().isEmpty) return errorThisFieldRequired;
                return null;
              },
            ).expand(),
          ),
          8.height,
          SNCommonProfileField(
            title: Confirm_Password,
            textFormField: TextFormField(
              controller: oldPasswordCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: Confirm_Password,
                hintStyle: secondaryTextStyle(),
                filled: true,
                fillColor: colorBackGround,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
              ),
              validator: (s) {
                if (s!.trim().isEmpty) return errorThisFieldRequired;
                return null;
              },
            ).expand(),
          ),
          16.height,
          Container(
            width: 180,
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: colorBlue, borderRadius: BorderRadius.circular(5), boxShadow: defaultBoxShadow()),
            child: Text(Change_Password, style: primaryTextStyle(color: white)),
          ).onTap(() {}),
        ],
      ),
    );
  }
}
