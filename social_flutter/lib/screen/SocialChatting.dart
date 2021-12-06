import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_flutter/screen/PurchaseMoreScreen.dart';
import 'package:social_flutter/utils/AppWidget.dart';
import 'package:social_flutter/utils/SocialColors.dart';
import 'package:social_flutter/utils/SocialConstant.dart';
import 'package:social_flutter/utils/SocialImages.dart';
import 'package:social_flutter/utils/SocialStrings.dart';

class SocialChatting extends StatefulWidget {
  static String tag = '/SocialChatting';

  @override
  SocialChattingState createState() => SocialChattingState();
}

class SocialChattingState extends State<SocialChatting> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var mToolbar = Container(
      width: MediaQuery.of(context).size.width,
      height: width * 0.15,
      color: social_white,
      margin: EdgeInsets.only(right: spacing_standard_new),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: spacing_standard_new),
                  width: width * 0.1,
                  height: width * 0.1,
                  decoration: boxDecoration(showShadow: false, bgColor: social_view_color, radius: 12),
                  child: Icon(Icons.keyboard_arrow_left, color: social_white),
                ),
              ),
              SizedBox(width: spacing_middle),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: social_ic_user1,
                  height: width * 0.1,
                  width: width * 0.1,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: spacing_standard),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text(social_name, fontFamily: fontMedium),
                  text(social_lbl_today_8_00_pm, textColor: social_textColorSecondary, fontSize: textSizeSMedium),
                ],
              )
            ],
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.call, color: social_textColorPrimary), onPressed: null),
                IconButton(icon: Icon(Icons.videocam, color: social_textColorPrimary), onPressed: null).expand(),
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: <Widget>[
                mToolbar,
                SizedBox(height: spacing_standard_new),
                PurchaseMoreScreen().expand(),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                //alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.width * 0.15,
                color: social_app_background_color,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.insert_emoticon, color: social_icon_color),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
                        decoration: InputDecoration(hintText: social_lbl_type_a_message, border: InputBorder.none),
                      ),
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset(social_send, color: social_icon_color),
                    SizedBox(width: 8),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(social_attachment, color: social_icon_color),
                        SizedBox(width: 8),
                        SvgPicture.asset(social_mic_line, color: social_icon_color),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
