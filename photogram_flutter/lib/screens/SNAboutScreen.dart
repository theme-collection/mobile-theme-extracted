import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';

class SNAboutScreen extends StatefulWidget {
  static String tag = '/SNAboutScreen';

  @override
  SNAboutScreenState createState() => SNAboutScreenState();
}

class SNAboutScreenState extends State<SNAboutScreen> {
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
        appBar: appBar(context, 'About') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('App updates', style: primaryTextStyle()),
                16.height,
                Text('Data policy', style: primaryTextStyle()),
                16.height,
                Text('Terms of Use', style: primaryTextStyle()),
                16.height,
                Text('Open-source libraries', style: primaryTextStyle()),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
