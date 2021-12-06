import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

class SNAccountScreen extends StatefulWidget {
  static String tag = '/SNAccountScreen';

  @override
  SNAccountScreenState createState() => SNAccountScreenState();
}

class SNAccountScreenState extends State<SNAccountScreen> {
  List<SNSettingModel> accountItem = getAccountItemList();

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
        appBar: appBar(context, 'Account') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: accountItem.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    SNSettingModel data = accountItem[i];
                    return GestureDetector(
                      onTap: () {},
                      child: Text(data.name!, style: primaryTextStyle()).paddingOnly(top: 16, bottom: 16),
                    );
                  },
                ),
                8.height,
                Text('Switch to Professional account', style: boldTextStyle(color: Colors.blueAccent)).paddingOnly(left: 8, right: 8),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
