import 'package:event_flutter/model/EAForYouModel.dart';
import 'package:event_flutter/utils/EAColors.dart';
import 'package:event_flutter/utils/EADataProvider.dart';
import 'package:event_flutter/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EAFollowingScreen extends StatefulWidget {
  const EAFollowingScreen({Key? key}) : super(key: key);

  @override
  _EAFollowingScreenState createState() => _EAFollowingScreenState();
}

class _EAFollowingScreenState extends State<EAFollowingScreen> {
  List<EAForYouModel> list = getMayKnowData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          EAForYouModel data = list[index];
          return Container(
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                commonCachedNetworkImage(data.image, fit: BoxFit.cover, height: 60, width: 60).cornerRadiusWithClipRRect(35),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name!, style: boldTextStyle()),
                    4.height,
                    Text(data.add!, style: secondaryTextStyle()),
                  ],
                ).expand(),
                IconButton(
                  onPressed: () {
                    list.removeAt(index);
                    setState(() {});
                  },
                  icon: Icon(LineIcons.times_circle, color: primaryColor1, size: 30),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
