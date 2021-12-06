import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/store/SNCommentStore.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

import '../../../main.dart';

SNCommentStore commentStore = SNCommentStore();

class SNViewCommentScreen extends StatefulWidget {
  static String tag = '/SNViewCommentScreen';

  @override
  SNViewCommentScreenState createState() => SNViewCommentScreenState();
}

class SNViewCommentScreenState extends State<SNViewCommentScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  List<String> reactionList = ['❤️', ' 🙌🏼', ' 🔥', '👏🏼', '😢', '😍', ' 😮', ' 😂'];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    commentStore.commentList.addAll(getCommentList());
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.isNotEmpty) {
      var commentModel = SNCommentModel();
      commentModel.comment = msgController.text.toString();
      commentModel.time = formatter.format(DateTime.now());
      hideKeyboard(context);

      commentStore.updateComments(commentModel);

      msgController.text = '';

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    commentStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        'Comments',
        actions: [
          IconButton(
            icon: Icon(Icons.send_rounded, color: appStore.iconColor),
            onPressed: () {},
          )
        ],
      ) as PreferredSizeWidget?,
      body: Responsive(
        web: Container(),
        mobile: Observer(
          builder: (_) => Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                decoration: BoxDecoration(color: appStore.appBarColor),
                child: ListView.separated(
                  separatorBuilder: (_, i) => Divider(color: Colors.transparent),
                  shrinkWrap: true,
                  reverse: true,
                  controller: scrollController,
                  itemCount: commentStore.commentList.length,
                  padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
                  itemBuilder: (_, index) {
                    SNCommentModel data = commentStore.commentList[index % commentStore.commentList.length];
                    return Observer(
                      builder: (_) => Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(backgroundImage: AssetImage(data.userImg.validate()), radius: 20).visible(
                              data.userImg.validate().isNotEmpty,
                              defaultWidget: Container(
                                child: Icon(Icons.person_outlined),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(color: Colors.white, boxShadow: defaultBoxShadow(), shape: BoxShape.circle),
                              ),
                            ),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        Text(data.name.validate(), style: boldTextStyle(size: 14, color: appStore.textSecondaryColor)),
                                        4.width,
                                        Text(data.comment.validate(), style: primaryTextStyle(size: 14, color: appStore.textSecondaryColor)),
                                      ],
                                    ),
                                    Icon(data.isLike ? AntDesign.heart : AntDesign.hearto, color: data.isLike ? Colors.red : Colors.grey, size: 20).onTap(() {
                                      data.isLike = !data.isLike;
                                      setState(() {});
                                    }),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(data.time.validate(), style: secondaryTextStyle()),
                                    8.width,
                                    Text('Reply', style: boldTextStyle(color: appStore.textSecondaryColor)).onTap(() {
                                      print('Tapped');
                                      FocusScope.of(context).requestFocus(msgFocusNode);
                                    }),
                                  ],
                                ),
                                /*Container(
                                  margin: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(color: appStore.appBarColor),
                                  child: ListView.separated(
                                    separatorBuilder: (_, i) => Divider(color: Colors.transparent),
                                    shrinkWrap: true,
                                    itemCount: data.subComment?.length,
                                    itemBuilder: (_, index) {
                                      SNCommentModel subCommentData = data.subComment[index];
                                      return Row(
                                        children: [
                                          CircleAvatar(backgroundImage: AssetImage(subCommentData.userImg.validate()), radius: 20).visible(
                                            subCommentData.userImg.validate().isNotEmpty,
                                            defaultWidget: Container(
                                              child: Icon(Icons.person_outlined),
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(color: Colors.white, boxShadow: defaultBoxShadow(), shape: BoxShape.circle),
                                            ),
                                          ),
                                          16.width,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(subCommentData.name.validate(), style: boldTextStyle(size: 14, color: appStore.textSecondaryColor)),
                                                      4.width,
                                                      Text(subCommentData.comment.validate(), style: primaryTextStyle(size: 14, color: appStore.textSecondaryColor)),
                                                    ],
                                                  ),
                                                  Icon(subCommentData.isLike ? AntDesign.heart : AntDesign.hearto, color: subCommentData.isLike ? Colors.red : Colors.grey, size: 20).onTap(() {
                                                    subCommentData.isLike = !data.isLike;
                                                    setState(() {});
                                                  }),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(subCommentData.time.validate(), style: secondaryTextStyle()),
                                                  8.width,
                                                  Text('Reply', style: boldTextStyle(color: appStore.textSecondaryColor)).onTap(() {
                                                    print('Tapped');
                                                    FocusScope.of(context).requestFocus(msgFocusNode);
                                                  }),
                                                ],
                                              ),
                                            ],
                                          ).expand()
                                        ],
                                      );
                                    },
                                  ),
                                ).visible(data.subComment?.isNotEmpty),*/
                              ],
                            ).expand(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: context.width(),
                        child: ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: reactionList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int i) {
                            return GestureDetector(
                              onTap: () {
                                msgController.text = reactionList[i];
                              },
                              child: Text(reactionList[i], style: primaryTextStyle(size: 30)).paddingOnly(left: 8, right: 8),
                            );
                          },
                        ),
                      ),
                      Divider(height: 0.5, color: appDividerColor),
                      4.height,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            scrollPadding: EdgeInsets.all(8),
                            controller: msgController,
                            focusNode: msgFocusNode,
                            cursorColor: appStore.iconColor,
                            autofocus: true,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(hintText: 'Add Comment', hintStyle: secondaryTextStyle(size: 18), border: InputBorder.none),
                            style: primaryTextStyle(size: 18),
                            onSubmitted: (s) {
                              sendClick();
                            },
                          ).expand(),
                          Text('Post', style: primaryTextStyle(color: Colors.blueAccent, size: 18)).onTap(() {
                            sendClick();
                          }).paddingOnly(left: 8, right: 8)
                        ],
                      ).paddingOnly(left: 12, right: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
