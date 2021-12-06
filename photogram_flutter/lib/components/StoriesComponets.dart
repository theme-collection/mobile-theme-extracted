import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/components/ChatComponent.dart';
import 'package:photogram_flutter/components/MessageComponent.dart';
import 'package:photogram_flutter/components/PostComponent.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/screens/SNStoriesDetailScreen.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNImages.dart';

import '../../../main.dart';
import 'SNSavedComponent.dart';

class StoriesComponent extends StatefulWidget {
  static String tag = '/StoriesComponent';

  @override
  StoriesComponentState createState() => StoriesComponentState();
}

class StoriesComponentState extends State<StoriesComponent> {
  String selectedTab = 'Home';

  List<SNStoriesModel> storiesListing = getStories();

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
    Widget storiesList() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8, top: 8),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(SNUser1, height: 50, width: 50, fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.blue, border: Border.all(color: white, width: 1.5), borderRadius: BorderRadius.circular(20)),
                        child: Icon(Icons.add, size: 20, color: white),
                      ),
                    ],
                  ),
                  4.height,
                  Text('Your Story', style: primaryTextStyle(size: 14))
                ],
              ),
            ),
            Container(
              height: 110,
              padding: EdgeInsets.only(left: 8, top: 10),
              child: ListView.builder(
                itemCount: storiesListing.length,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  SNStoriesModel data = storiesListing[i];

                  return GestureDetector(
                    onTap: () {
                      SNStoriesDetailScreen(model: data).launch(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.transparent, width: 2),
                              gradient: LinearGradient(
                                colors: data.seen!
                                    ? [appStore.iconSecondaryColor!, appStore.iconSecondaryColor!]
                                    : [
                                        getColorFromHex('#FFDC80'),
                                        getColorFromHex('#C13584'),
                                        getColorFromHex('#833AB4'),
                                      ],
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.asset(data.img!, height: 50, width: 50, fit: BoxFit.cover),
                            ),
                          ),
                          4.height,
                          Text(data.name!, style: primaryTextStyle(size: 14))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget webWidget() {
      return Row(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(24),
                    child: Image.asset(
                      SNHomeIcon,
                      color: selectedTab == 'Home' ? black : grey,
                    ).onTap(() {
                      selectedTab = 'Home';
                      setState(() {});
                    }),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(24),
                    child: Image.asset(
                      SNExploreIcon,
                      color: selectedTab == 'Explore' ? black : grey,
                    ).onTap(() {
                      selectedTab = 'Explore';
                      setState(() {});
                    }),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(24),
                    child: Image.asset(
                      SNMsgIcon,
                      color: selectedTab == 'Message' ? black : grey,
                    ).onTap(() {
                      selectedTab = 'Message';
                      setState(() {});
                    }),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(24),
                    child: Image.asset(
                      SNSavedIcon,
                      color: selectedTab == 'Saved' ? black : grey,
                    ).onTap(() {
                      selectedTab = 'Saved';
                      setState(() {});
                    }),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(width: 0.5).paddingOnly(top: 16, bottom: 16),
          Expanded(
            flex: 8,
            child: Container(
              height: context.height(),
              child: SingleChildScrollView(
                physics: selectedTab == 'Message' ? NeverScrollableScrollPhysics() : ScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        storiesList(),
                        PostComponent(),
                      ],
                    ).visible(selectedTab == 'Home'),
                    Container(
                      height: context.height(),
                      width: context.width(),
                      color: Colors.red,
                    ).visible(selectedTab == 'Explore'),
                    Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(8),
                      height: context.height() - 120,
                      decoration: boxDecoration(color: appDividerColor),
                      child: Row(
                        children: [
                          ChatComponent().expand(flex: 3),
                          VerticalDivider(width: 0.5).paddingOnly(top: 24, bottom: 24),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: MessageComponent(),
                          ).expand(flex: 8),
                        ],
                      ),
                    ).visible(selectedTab == 'Message'),
                    Container(
                      width: context.width(),
                      color: Colors.black,
                      child: SNSavedComponent(),
                    ).visible(selectedTab == 'Saved'),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget mobileWidget() {
      return Column(
        children: [
          storiesList(),
          Divider(height: 0.5, color: Colors.grey),
        ],
      );
    }

    return SafeArea(
      child: Responsive(
        web: webWidget(),
        mobile: mobileWidget(),
      ),
    );
  }
}
