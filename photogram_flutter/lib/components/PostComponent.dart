import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/screens/SNViewCommentScreen.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNColors.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

import '../../../main.dart';

class PostComponent extends StatefulWidget {
  static String tag = '/PostComponent';

  @override
  PostComponentState createState() => PostComponentState();
}

class PostComponentState extends State<PostComponent> {
  List<SNPostModel> postList = getPostList();

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
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: maxItemCount,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        SNPostModel data = postList[i % postList.length];

        return PostItemWidget(data: data);
      },
    );
  }
}

class PostItemWidget extends StatefulWidget {
  final SNPostModel? data;

  PostItemWidget({this.data});

  @override
  PostItemWidgetState createState() => PostItemWidgetState();
}

class PostItemWidgetState extends State<PostItemWidget> {
  FlareControls flareControls = FlareControls();
  var commentCont = TextEditingController();

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
    return Responsive(
      web: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            commonCacheImageWidget(widget.data!.img, height: 220, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRect(10).expand(flex: 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                4.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(widget.data!.userImg!, height: 40, width: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(20).paddingOnly(left: 16, right: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.data!.name!, style: boldTextStyle(), maxLines: 1),
                        FittedBox(child: Text(widget.data!.subTitle!, style: secondaryTextStyle(), maxLines: 1)),
                      ],
                    ).expand(),
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.height,
                    Text(widget.data!.detail!, style: primaryTextStyle(size: 12, color: appStore.textSecondaryColor)),
                    16.height,
                    Row(
                      children: [Icon(Ionicons.md_heart, color: Colors.red), 4.width, Text('Like by smith_john and ${widget.data!.totalLike} others.', style: primaryTextStyle(size: 12, color: appStore.textSecondaryColor)).expand()],
                    )
                  ],
                ).paddingOnly(left: 16, right: 16),
                16.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: ListView.builder(
                        itemCount: widget.data!.comment!.length >= 3 ? 3 : widget.data!.comment!.length,
                        shrinkWrap: true,
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          SNUserModel user = widget.data!.comment![i];
                          return Container(
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(user.img!, height: 20, width: 20, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                                4.width,
                                createRichText(
                                  list: [
                                    TextSpan(text: user.name, style: boldTextStyle(size: 12, color: appStore.textSecondaryColor)),
                                    TextSpan(text: ' ${user.comment}', style: primaryTextStyle(size: 12, color: appStore.textSecondaryColor)),
                                  ],
                                  maxLines: 2,
                                ).expand(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: context.width() * 0.4,
                        decoration: boxDecoration(radius: 25, bgColor: commentViewBackGround, showShadow: true),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(widget.data!.userImg!, height: 30, width: 30, fit: BoxFit.cover).cornerRadiusWithClipRRect(15).paddingOnly(left: 16),
                            TextFormField(
                              controller: commentCont,
                              style: primaryTextStyle(size: 12),
                              cursorColor: appStore.textPrimaryColor,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 16, right: 16),
                                hintStyle: secondaryTextStyle(size: 12),
                                hintText: 'add comment as Smith John',
                                filled: true,
                                fillColor: colorBackGround,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (s) {
                                if (s!.trim().isEmpty) return errorThisFieldRequired;
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                            ).expand(),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(20), backgroundColor: commentViewBackGround),
                              child: Icon(Icons.send, color: appStore.iconSecondaryColor),
                            ).paddingRight(8)
                          ],
                        ),
                      ).cornerRadiusWithClipRRect(25).paddingOnly(left: 8, right: 8),
                    )
                  ],
                )
              ],
            ).expand(flex: 2)
          ],
        ),
      ),
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.height,
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 2),
                  gradient: LinearGradient(
                    colors: [
                      getColorFromHex('#FFDC80'),
                      getColorFromHex('#C13584'),
                      getColorFromHex('#833AB4'),
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: commonCacheImageWidget(widget.data!.userImg.validate(), fit: BoxFit.cover),
                ).onTap(() {
                  /*SNStoriesDetailScreen().launch(context);*/
                }),
              ),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data!.name.validate(), style: boldTextStyle()),
                  Text(widget.data!.location.validate(), style: secondaryTextStyle(size: 12)).visible(widget.data!.location.isNotEmpty),
                ],
              ).expand(),
              Icon(Feather.more_vertical).onTap(() {}),
            ],
          ).paddingOnly(left: 8, right: 8),
          8.height,
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                widget.data!.isLike = true;
                flareControls.play("like");
              });
            },
            child: Stack(
              children: [
                commonCacheImageWidget(widget.data!.img.validate(), fit: BoxFit.fitWidth, width: context.width()),
                Container(
                  width: double.infinity,
                  height: 250,
                  child: Center(
                    child: SizedBox(width: 80, height: 80, child: FlareActor('assets/instagram_like.flr', controller: flareControls, animation: 'idle')),
                  ),
                )
              ],
            ),
          ),
          8.height,
          Row(
            children: [
              Row(
                children: [
                  Icon(widget.data!.isLike ? AntDesign.heart : AntDesign.hearto, color: widget.data!.isLike ? Colors.redAccent : appStore.iconColor).onTap(() {
                    widget.data!.isLike = !widget.data!.isLike;
                    setState(() {});
                  }),
                  12.width,
                  Icon(Icons.chat_outlined, color: appStore.iconColor).onTap(() {
                    SNViewCommentScreen().launch(context);
                  }),
                  12.width,
                  Icon(Feather.send, color: appStore.iconColor).onTap(() {}),
                  12.width,
                ],
              ).expand(),
              Icon(Feather.bookmark, color: appStore.iconColor).onTap(() {}),
            ],
          ).paddingOnly(left: 8, right: 8),
          8.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.data!.totalLike} likes', style: boldTextStyle()).paddingOnly(right: 8),
              8.height,
              Text(widget.data!.detail!, style: secondaryTextStyle()).paddingOnly(right: 8),
              8.height,
              Text('View all ${widget.data!.totalLike} comments', style: boldTextStyle(color: appStore.textSecondaryColor)).paddingOnly(right: 8).onTap(() {
                SNViewCommentScreen().launch(context);
              }),
            ],
          ).paddingOnly(left: 8, right: 8),
          24.height,
        ],
      ),
    );
  }
}
