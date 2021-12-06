import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';

class SNHelpScreen extends StatefulWidget {
  static String tag = '/SNHelpScreen';

  @override
  SNHelpScreenState createState() => SNHelpScreenState();
}

class SNHelpScreenState extends State<SNHelpScreen> {
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
        appBar: appBar(context, 'Help') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('Report a problem', style: primaryTextStyle()),
                16.height,
                Text('Help Centre', style: primaryTextStyle()),
                16.height,
                Text('Privacy and security help', style: primaryTextStyle()),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
