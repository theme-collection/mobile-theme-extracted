import 'package:flutter/material.dart';
import 'package:imail_flutter/main.dart';
import 'package:imail_flutter/model/GMModel.dart';
import 'package:imail_flutter/utils/AppColors.dart';
import 'package:imail_flutter/utils/AppWidget.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:imail_flutter/utils/GMDataProvider.dart';
import 'package:imail_flutter/utils/GMImages.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchMailComponent extends StatefulWidget {
  @override
  _SearchMailComponentState createState() => _SearchMailComponentState();
}

class _SearchMailComponentState extends State<SearchMailComponent> {
  List<GMAccountModel> accountList = getAccountList();

  void _mailAccountDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: SingleChildScrollView(
            child: Container(
              width: context.width() * 0.7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Icon(Icons.close).onTap(() {
                      finish(context);
                    }),
                    40.width,
                    Image.asset(GMGoogleIcon, width: 120, height: 30),
                  ]),
                  16.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: getColorFromHex('#00879B')),
                        child: Text('B', style: boldTextStyle(size: 18, color: Colors.white)).center(),
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bruce Aaron', style: boldTextStyle()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('brush123@gmail.com', style: secondaryTextStyle()),
                              Text('99+', style: secondaryTextStyle()),
                            ],
                          ),
                          8.height,
                          Container(
                            padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                            decoration: boxDecoration(color: appDividerColor, radius: 20),
                            child: Text('Manage your Google Account', style: boldTextStyle(size: 12)),
                          ),
                        ],
                      ).expand(),
                    ],
                  ),
                  16.height,
                  Divider(color: GMAppDividerColor),
                  ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: accountList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      GMAccountModel data = accountList[index];
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: getColorFromHex('#00879B')),
                                child: Text(data.firstLetter!, style: boldTextStyle(size: 18, color: Colors.white)).center(),
                              ),
                              16.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data.name!, style: boldTextStyle(size: 14)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(data.mail.validate(), style: secondaryTextStyle()),
                                      8.width,
                                      Text(data.totalMail.validate(), style: secondaryTextStyle(size: 12)),
                                    ],
                                  ),
                                ],
                              ).expand(),
                            ],
                          ),
                        ],
                      ).paddingOnly(top: 8, bottom: 8);
                    },
                  ),
                  16.height,
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      16.width,
                      Text('Add another account', style: boldTextStyle(size: 14)),
                    ],
                  ),
                  16.height,
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      16.width,
                      Text('Manage account on this device', style: boldTextStyle(size: 14)),
                    ],
                  ),
                  8.height,
                  Divider(color: GMAppDividerColor),
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Privacy policy', style: primaryTextStyle(size: 14)),
                      8.width,
                      Text('.', style: boldTextStyle()),
                      8.width,
                      Text('Terms of service', style: primaryTextStyle(size: 14)),
                    ],
                  ).paddingOnly(bottom: 8),
                ],
              ),
            ),
          ),
        ).center();
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: GMWhiteColor,
        boxShadow: [
          BoxShadow(offset: Offset(0.0, 1.0), color: GMGreyColor, blurRadius: 1.0),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              Icon(Icons.menu).onTap(() {
                drawerKey.currentState!.openDrawer();
              }),
              8.width,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search in emails',
                  hintStyle: TextStyle(color: GMGreyColor),
                  filled: true,
                  fillColor: GMWhiteColor,
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                ),
              ).expand(),
            ],
          ).expand(),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(shape: BoxShape.circle, color: getColorFromHex('#00879B')),
            child: Text(
              'B',
              style: boldTextStyle(size: 18, color: Colors.white),
            ).center(),
          ).onTap(() {
            _mailAccountDialog();
          }),
        ],
      ),
    );
  }
}
