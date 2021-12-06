import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';

import '../../../main.dart';

class SNSaveItemWidget extends StatefulWidget {
  static String tag = '/SNSaveItemWidget';
  final SNSavedModel data;

  SNSaveItemWidget(this.data);

  @override
  SNSaveItemWidgetState createState() => SNSaveItemWidgetState();
}

class SNSaveItemWidgetState extends State<SNSaveItemWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
      margin: EdgeInsets.all(8),
      //height: 200,
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            onEnter: (event) {
              widget.data.isMouse = true;
              setState(() {});
            },
            onExit: (event) {
              widget.data.isMouse = false;
              setState(() {});
            },
            child: Container(
              height: 320,
              width: context.width(),
              child: Stack(
                children: [
                  Image.asset(widget.data.img!, fit: BoxFit.cover, height: isMobile ? 110 : 320, width: context.width()).cornerRadiusWithClipRRect(8),
                  Container(
                    height: 320,
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(10), backgroundColor: black.withOpacity(0.6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite, color: white),
                            4.width,
                            Text(widget.data.totalLikeCount!, style: primaryTextStyle(color: white)),
                          ],
                        ),
                        8.width,
                        Row(
                          children: [
                            Icon(Ionicons.ios_chatbubbles, color: white),
                            4.width,
                            Text('${widget.data.totalCommentCount} comment', style: primaryTextStyle(color: white)),
                          ],
                        ),
                      ],
                    ),
                  ).visible(widget.data.isMouse)
                ],
              ),
            ),
          ),
          8.width,
        ],
      ),
    ).onTap(() async {});
  }
}
