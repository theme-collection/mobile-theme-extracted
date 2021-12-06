import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';

class SNAdsScreen extends StatefulWidget {
  static String tag = '/SNAdsScreen';

  @override
  SNAdsScreenState createState() => SNAdsScreenState();
}

class SNAdsScreenState extends State<SNAdsScreen> {
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
        appBar: appBar(context, 'Ads') as PreferredSizeWidget?,
        body: Responsive(
          web: Container(),
          mobile: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('Ad topic preferences', style: primaryTextStyle()),
                16.height,
                Text('Ad activity', style: primaryTextStyle()),
                16.height,
                Text('About ads', style: primaryTextStyle()),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
