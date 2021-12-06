import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/screens/SNEditProfileScreen.dart';
import 'package:photogram_flutter/screens/SNSettingScreen.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNImages.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

import '../../../main.dart';

class ProfileComponent extends StatefulWidget {
  static String tag = '/profileComponent';

  @override
  ProfileComponentState createState() => ProfileComponentState();
}

class ProfileComponentState extends State<ProfileComponent> {
  String selectedTab = 'Profile';
  TabController? tabController;

  List<Widget> tabs = [];
  List<SNAccountModel> accountList = getAccountList();
  List<SNProfileSideDrawerModel> drawerList = getProfileSideDrawerList();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedTabIndex = 0;
  var searchCont = TextEditingController();
  List<SNPostModel> postList = getPostList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    tabs.add(Container(padding: EdgeInsets.all(16.0), child: Text(Profile)));
    tabs.add(Container(padding: EdgeInsets.all(16.0), child: Text(Archive)));
    tabs.add(Container(padding: EdgeInsets.all(16.0), child: Text(Setting)));
    setState(() {});
  }

  void openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void closeEndDrawer() {
    finish(context);
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    void createNew(BuildContext aContext) {
      showModalBottomSheet(
        context: aContext,
        backgroundColor: appStore.scaffoldBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (builder) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                16.height,
                Container(color: grey, height: 3, width: 50),
                16.height,
                Text(Create_New, style: boldTextStyle(size: 20)),
                16.height,
                Divider(height: 0.5, color: appDividerColor),
                16.height,
                options(
                  text: Feed_Post,
                  icon: MaterialIcons.grid_on,
                  textColor: appStore.textPrimaryColor,
                  iconColor: appStore.iconColor,
                  showRightArrow: false,
                ).onTap(() {
                  finish(context);
                }),
                options(
                  text: Story,
                  icon: Entypo.circular_graph,
                  textColor: appStore.textPrimaryColor,
                  iconColor: appStore.iconColor,
                  showRightArrow: false,
                ).onTap(() {
                  finish(context);
                }),
                options(
                  text: Story_Highlight,
                  icon: Entypo.circular_graph,
                  textColor: appStore.textPrimaryColor,
                  iconColor: appStore.iconColor,
                  showRightArrow: false,
                ).onTap(() {
                  finish(context);
                }),
                options(
                  text: IGTV_Video,
                  icon: Feather.tv,
                  textColor: appStore.textPrimaryColor,
                  iconColor: appStore.iconColor,
                  showRightArrow: false,
                ).onTap(() {
                  finish(context);
                }),
                options(
                  text: 'Reel',
                  icon: MaterialIcons.live_tv,
                  textColor: appStore.textPrimaryColor,
                  iconColor: appStore.iconColor,
                  showRightArrow: false,
                ).onTap(() {
                  finish(context);
                }),
                16.height,
              ],
            ).paddingAll(8),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                createNew(context);
              }),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Smith_John0667', style: boldTextStyle()),
              Icon(Icons.keyboard_arrow_down),
            ],
          ).onTap(() {
            accounts(context, accountList);
          }),
        ),
        body: Responsive(
          mobile: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    leading: Container(),
                    expandedHeight: 310.0,
                    floating: true,
                    pinned: true,
                    backgroundColor: white,
                    actions: [Container()],
                    bottom: TabBar(
                      indicatorColor: Colors.blueAccent,
                      tabs: [
                        Tab(icon: Image.asset(sn_myPost, height: 25, width: 25, color: appStore.iconColor)),
                        Tab(icon: Image.asset(sn_myPostTag, height: 25, width: 25, color: appStore.iconColor)),
                      ],
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            8.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(SNUser1),
                                      radius: 40,
                                    ).center(),
                                    Container(
                                      decoration: BoxDecoration(color: Colors.blue, border: Border.all(color: white, width: 0.5), borderRadius: BorderRadius.circular(20)),
                                      child: Icon(Icons.add, size: 18, color: white),
                                    ),
                                  ],
                                ),
                                24.width,
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('100', style: boldTextStyle(size: 18)),
                                      4.height,
                                      Text('Posts', style: boldTextStyle()),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('1.2k', style: boldTextStyle(size: 18)),
                                      4.height,
                                      Text('Followers', style: boldTextStyle()),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('16', style: boldTextStyle(size: 18)),
                                      4.height,
                                      Text('Following', style: boldTextStyle()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            8.height,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Smith John'.toUpperCase(), style: boldTextStyle(size: 18)),
                                Text('🚶KN:24', style: boldTextStyle(size: 18)),
                                Text('🚶cricket love🏏', style: boldTextStyle(size: 18)),
                              ],
                            ).paddingOnly(left: 8, bottom: 8),
                            Container(
                              width: context.width(),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(8),
                              decoration: boxDecoration(color: appDividerColor, bgColor: white, radius: 5.0),
                              child: Text(
                                'Edit Profile',
                                style: primaryTextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ).onTap(() {
                              SNEditProfileScreen().launch(context);
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: maxItemCount,
                    padding: EdgeInsets.only(bottom: 50),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      SNPostModel data = postList[index % postList.length];
                      return Stack(
                        children: [
                          commonCacheImageWidget(data.img.validate(), height: 200, width: 200, fit: BoxFit.cover),
                        ],
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
                  ),
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: postList.length,
                    padding: EdgeInsets.only(bottom: 50),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      SNPostModel data = postList[index];
                      return Stack(
                        children: [
                          commonCacheImageWidget(data.userImg.validate(), height: 200, width: 200, fit: BoxFit.cover),
                        ],
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        endDrawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text('___MR__PATEL___', style: boldTextStyle(size: 18)),
                    16.height,
                    Divider(height: 0.5, color: appDividerColor),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: drawerList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        SNProfileSideDrawerModel data = drawerList[i];
                        return Container(
                          padding: EdgeInsets.all(2),
                          child: GestureDetector(
                            onTap: () {
                              closeEndDrawer();
                            },
                            child: options(text: data.name!, icon: data.icon, textColor: appStore.textPrimaryColor, iconColor: appStore.iconColor, showRightArrow: false),
                          ),
                        );
                      },
                    ),
                  ],
                ).paddingOnly(left: 8, right: 8),
              ),
              Container(
                width: context.width(),
                child: Column(
                  children: [
                    Divider(height: 0.5, color: appDividerColor),
                    options(text: 'Settings', icon: Feather.settings, iconColor: appStore.iconColor, textColor: appStore.textPrimaryColor, showRightArrow: false),
                  ],
                ).paddingOnly(left: 8, right: 8),
              ).onTap(() {
                finish(context);
                SNSettingScreen().launch(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
