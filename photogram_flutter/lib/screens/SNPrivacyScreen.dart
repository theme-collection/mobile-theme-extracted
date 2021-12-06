import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/main.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

class SNPrivacyScreen extends StatefulWidget {
  static String tag = '/SNPrivacyScreen';

  @override
  SNPrivacyScreenState createState() => SNPrivacyScreenState();
}

class SNPrivacyScreenState extends State<SNPrivacyScreen> {
  bool isSwitched = false;
  List<SNSettingModel> interactionList = getInteractionList();
  List<SNSettingModel> connectionList = getConnectionList();

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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Privacy') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Account privacy', style: boldTextStyle()),
                8.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline, size: 25, color: appStore.iconColor),
                    8.width,
                    Text('Private account', style: primaryTextStyle()).expand(),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.blueAccent,
                      activeColor: Colors.white,
                    ),
                  ],
                ),
                Divider(height: 0.5, color: appDividerColor),
                8.height,
                Text('Interactions', style: boldTextStyle()),
                8.height,
                ListView.builder(
                  padding: EdgeInsets.only(top: 16, right: 16, bottom: 16),
                  itemCount: interactionList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    SNSettingModel data = interactionList[i];
                    return GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(data.icon.validate(), height: 20, width: 20, color: appStore.iconColor),
                            8.width,
                            Text(data.name.validate(), style: primaryTextStyle()).expand(),
                            Text(data.subTitle.validate(), style: primaryTextStyle()).visible(data.name!.isNotEmpty)
                          ],
                        ).paddingOnly(top: 16, bottom: 16));
                  },
                ),
                8.height,
                Divider(height: 0.5, color: appDividerColor),
                8.height,
                Text('Connections', style: boldTextStyle()),
                8.height,
                ListView.builder(
                  padding: EdgeInsets.only(top: 16, right: 16, bottom: 16),
                  itemCount: connectionList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    SNSettingModel data = connectionList[i];
                    return GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(data.icon.validate(), height: 25, width: 25, color: appStore.iconColor),
                            8.width,
                            Text(data.name.validate(), style: primaryTextStyle()).expand(),
                            Text(data.subTitle.validate(), style: primaryTextStyle()).visible(data.name!.isNotEmpty)
                          ],
                        ).paddingOnly(top: 16, bottom: 16));
                  },
                ),
              ],
            ).paddingOnly(left: 8, right: 8),
          ),
        ),
      ),
    );
  }
}
