import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

class SNSetThemeScreen extends StatefulWidget {
  static String tag = '/SNSetThemeScreen';

  @override
  SNSetThemeScreenState createState() => SNSetThemeScreenState();
}

class SNSetThemeScreenState extends State<SNSetThemeScreen> {
  List<SNEmailSMSModel> setThemeList = getSetThemeList();
  int? selectedRadio = 2;

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
        appBar: appBar(context, 'Set Theme') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: setThemeList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    SNEmailSMSModel data = setThemeList[i];
                    return GestureDetector(
                      onTap: () {},
                      child: RadioListTile(
                        value: i,
                        groupValue: selectedRadio,
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text(data.title!, style: primaryTextStyle()),
                        onChanged: (dynamic val) {
                          selectedRadio = val;
                          setState(() {});
                        },
                      ),
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
