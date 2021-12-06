import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';

import '../../../main.dart';

class HomeComponents extends StatefulWidget {
  static String tag = '/HomeComponents';

  @override
  HomeComponentsState createState() => HomeComponentsState();
}

class HomeComponentsState extends State<HomeComponents> {
  var searchCont = TextEditingController();

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
    Widget webWidget() {
      return Container(
        width: context.width(),
        height: 100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(SNAppName, style: primaryTextStyle(size: 50, fontFamily: fontBillabong, weight: FontWeight.w200, color: fbColor)),
                32.width,
                Container(
                  width: context.width() * 0.35,
                  child: TextFormField(
                    controller: searchCont,
                    style: primaryTextStyle(size: 12),
                    cursorColor: appStore.textPrimaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16, right: 16),
                      hintStyle: secondaryTextStyle(size: 18),
                      hintText: Search,
                      filled: true,
                      fillColor: colorBackGround,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0), borderSide: BorderSide(color: grey.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0), borderSide: BorderSide(color: grey.withOpacity(0.5))),
                      suffixIcon: Icon(
                        Icons.search,
                        color: appStore.iconSecondaryColor,
                      ).paddingOnly(right: 16),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().isEmpty) return errorThisFieldRequired;
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ).paddingOnly(left: 24, right: 16, top: 24)
          ],
        ),
      );
    }

    Widget mobileWidget() {
      return Container(
        decoration: boxDecoration(showShadow: true),
        child: Column(
          children: [
            Container(
              height: 50,
              width: context.width(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_enhance, size: 30),
                    onPressed: () {},
                  ),
                  Text(SNAppName, style: primaryTextStyle(size: 34, fontFamily: fontBillabong, weight: FontWeight.w200, color: fbColor)),
                  IconButton(
                    icon: Icon(Icons.message, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Responsive(
      mobile: mobileWidget(),
      web: webWidget(),
    );
  }
}
