import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imail_flutter/model/GMModel.dart';
import 'package:imail_flutter/utils/AppColors.dart';
import 'package:imail_flutter/utils/GMDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import 'GMColors.dart';

class GMDrawer extends StatefulWidget {
  Function? onTap;

  @override
  _GMDrawerState createState() => _GMDrawerState();
}

class _GMDrawerState extends State<GMDrawer> {
  @override
  Widget build(BuildContext context) {
    List<DrawerModel> getDrawer = getDrawerList(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text('Gmail', style: primaryTextStyle(color: GMRedColor, size: 22)),
          ),
          Divider(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: getDrawer.length,
            itemBuilder: (context, index) {
              DrawerModel data = getDrawer[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: data.leading ?? 0.height,
                    dense: true,
                    title: Text(data.title.validate(), style: primaryTextStyle(color: GMBlackColor, size: 16)),
                    trailing: data.trailing ?? 0.height,
                  ),
                  Divider(color: appDividerColor).visible(index == 0 || index == 16),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Text('ALL LABELS', style: primaryTextStyle(color: GMBlackColor, size: 12)),
                  ).visible(index == 4),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Text('GOOGLE APPS', style: primaryTextStyle(color: GMBlackColor, size: 12)),
                  ).visible(index == 14),
                ],
              );
            },
          ),
          20.height,
        ],
      ),
    );
  }
}
