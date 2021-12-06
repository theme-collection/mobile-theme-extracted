import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNImages.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

import '../../../main.dart';

class EditProfileComponent extends StatefulWidget {
  static String tag = '/EditProfileComponent';

  @override
  EditProfileComponentState createState() => EditProfileComponentState();
}

class EditProfileComponentState extends State<EditProfileComponent> {
  var nameCont = TextEditingController();
  var usernameCont = TextEditingController();
  var websiteCont = TextEditingController();
  var bioCont = TextEditingController();
  var emailCont = TextEditingController();
  var phoneCont = TextEditingController();
  var genderCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    nameCont.text = name;
    usernameCont.text = Username;
    bioCont.text = '🚶Gj:21 \n🚶wish me  26/6🎂 \n🚶Bappa lover\n🚶cricket love🏏\n🚶photo shot lover😎';
    emailCont.text = 'smithJhon132@gmail.com';
    phoneCont.text = '+91 2347546982';
    genderCont.text = 'Male';
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
              Image.asset(SNUser3, height: 60, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.height,
                  Text(Username, style: primaryTextStyle()),
                  Text(Change_Profile_Photo, style: boldTextStyle(color: Colors.blueAccent)),
                ],
              ),
            ],
          ),
          16.height,
          SNCommonProfileField(
            title: nameLbl,
            textFormField: TextFormField(
              controller: nameCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: nameLbl,
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
          SNCommonProfileField(
            title: usernameHintText,
            textFormField: TextFormField(
              controller: usernameCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: usernameHintText,
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
          SNCommonProfileField(
            title: Website,
            textFormField: TextFormField(
              controller: websiteCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                hintText: Website,
                hintStyle: secondaryTextStyle(),
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
          SNCommonProfileField(
            title: Bio,
            textFormField: TextFormField(
              controller: bioCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                hintText: Bio,
                hintStyle: primaryTextStyle(),
                fillColor: colorBackGround,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: grey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: appDividerColor)),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              validator: (s) {
                if (s!.trim().isEmpty) return errorThisFieldRequired;
                return null;
              },
            ).expand(),
          ),
          16.height,
          SNCommonProfileField(
            title: 'Email',
            textFormField: TextFormField(
              controller: emailCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                hintText: 'Email',
                hintStyle: primaryTextStyle(),
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
          SNCommonProfileField(
            title: 'Phone Number',
            textFormField: TextFormField(
              controller: phoneCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                hintText: 'Phone Number',
                hintStyle: primaryTextStyle(),
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
          SNCommonProfileField(
            title: 'Gender',
            textFormField: TextFormField(
              controller: genderCont,
              cursorColor: appStore.textPrimaryColor,
              style: boldTextStyle(size: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                hintText: 'Select gender',
                hintStyle: primaryTextStyle(),
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
            child: Text(Submit, style: primaryTextStyle(color: white)),
          ).onTap(() {}),
        ],
      ),
    );
  }
}
