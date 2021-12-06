import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

class SNSecurityScreen extends StatefulWidget {
  static String tag = '/SNSecurityScreen';

  @override
  SNSecurityScreenState createState() => SNSecurityScreenState();
}

class SNSecurityScreenState extends State<SNSecurityScreen> {
  List<SNSettingModel> loginSecurityList = getLoginSecurityItem();
  List<SNSettingModel> dataHistoryList = getDataHistoryItem();

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
        appBar: appBar(context, 'Security') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('Login Security', style: boldTextStyle()),
                16.height,
                ListView.builder(
                  itemCount: loginSecurityList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    SNSettingModel data = loginSecurityList[i];
                    return SettingWidget(data: data).onTap(() {
                      if (data.screenWidget != null) {
                        data.screenWidget.launch(context);
                      }
                    });
                  },
                ),
                16.height,
                Text('Data and history', style: boldTextStyle()),
                16.height,
                ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: dataHistoryList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    SNSettingModel data = dataHistoryList[i];
                    return GestureDetector(
                      onTap: () {
                        if (i == 3) {
                          SNSecurityScreen().launch(context);
                        }
                      },
                      child: SettingWidget(data: data),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
