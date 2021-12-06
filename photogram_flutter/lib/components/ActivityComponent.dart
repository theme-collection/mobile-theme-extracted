import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

import '../../../main.dart';

class ActivityComponent extends StatefulWidget {
  static String tag = '/ActivityComponent';

  @override
  ActivityComponentState createState() => ActivityComponentState();
}

class ActivityComponentState extends State<ActivityComponent> {
  List<SNActivityModel> activityList = getActivityList();

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarWidget('Activity', showBack: false),
          16.height,
          ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(8),
            itemCount: 100,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              SNActivityModel data = activityList[i % activityList.length];

              return Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    commonCacheImageWidget(data.userImg.validate(), height: 45, width: 45, fit: BoxFit.cover).cornerRadiusWithClipRRect(20),
                    16.width,
                    createRichText(list: [
                      TextSpan(
                        text: data.name,
                        style: boldTextStyle(size: 14, color: appStore.textSecondaryColor),
                      ),
                      TextSpan(text: ' ${data.comment}', style: primaryTextStyle(size: 12, color: appStore.textSecondaryColor)),
                    ], maxLines: 2)
                        .expand(),
                    commonCacheImageWidget(data.commentImg.validate(), height: 45, width: 45, fit: BoxFit.cover).cornerRadiusWithClipRRect(5).paddingOnly(left: 16, right: 16)
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
