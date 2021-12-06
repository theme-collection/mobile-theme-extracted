import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/components/HomeComponent.dart';
import 'package:photogram_flutter/components/PostComponent.dart';
import 'package:photogram_flutter/components/ProfileComponent.dart';
import 'package:photogram_flutter/components/StoriesComponets.dart';
import 'package:photogram_flutter/screens/SNMessageScreen.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';

class SNDashboardScreen extends StatefulWidget {
  static String tag = '/SNDashboardScreen';

  @override
  SNDashboardScreenState createState() => SNDashboardScreenState();
}

class SNDashboardScreenState extends State<SNDashboardScreen> {
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
    return Scaffold(
      appBar: isMobile
          ? AppBar(
              leading: IconButton(
                icon: Icon(Feather.camera),
                onPressed: () {
                  /*SNAddPostScreen().launch(context);*/
                },
              ),
              title: Text(SNAppName, style: primaryTextStyle(size: 30, fontFamily: fontBillabong, weight: FontWeight.w100)),
              actions: [
                IconButton(
                  icon: Icon(FontAwesome.send),
                  onPressed: () {
                    SNMessageScreen().launch(context);
                  },
                ),
              ],
            )
          : null,
      body: Container(
        height: context.height(),
        width: context.width(),
        /*constraints: BoxConstraints(minWidth: 800),*/
        child: Responsive(
          web: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    HomeComponents(),
                    StoriesComponent(),
                  ],
                ),
              ),
              VerticalDivider(width: 0.5),
              Expanded(
                flex: 3,
                child: Container(
                  child: ProfileComponent(),
                ),
              ),
            ],
          ),
          mobile: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.height,
                StoriesComponent(),
                4.height,
                PostComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
