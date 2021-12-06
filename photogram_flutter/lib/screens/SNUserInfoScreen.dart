import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppColors.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNImages.dart';

import '../../../main.dart';

class SNUserInfoScreen extends StatefulWidget {
  static String tag = '/SNUserInfoScreen';

  final SNSearchModel? data;

  SNUserInfoScreen({this.data});

  @override
  SNUserInfoScreenState createState() => SNUserInfoScreenState();
}

class SNUserInfoScreenState extends State<SNUserInfoScreen> {
  List<SNPostModel> postList = getPostList();

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
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              finish(context);
            }),
        title: Row(
          children: [
            Text(widget.data!.name!, style: boldTextStyle()).onTap(() {}),
            8.width,
            Icon(Octicons.verified, color: Colors.blueAccent, size: 15).visible(widget.data!.isVerifyAccount),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
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
                              CircleAvatar(backgroundImage: AssetImage(widget.data!.userImg!), radius: 40).center(),
                              24.width,
                              Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(widget.data!.posts.toString(), style: boldTextStyle(size: 18)),
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
                                    Text(widget.data!.follower.toString(), style: boldTextStyle(size: 18)),
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
                                    Text(widget.data!.following.toString(), style: boldTextStyle(size: 18)),
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
                              Text(widget.data!.name!.toUpperCase(), style: boldTextStyle(size: 18)),
                              Text('🚶KN:24', style: boldTextStyle(size: 18)),
                              Text('🚶cricket love🏏', style: boldTextStyle(size: 18)),
                            ],
                          ).paddingOnly(left: 8, bottom: 8),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: boxDecoration(color: appDividerColor, bgColor: widget.data!.isFollow ? Colors.blueAccent : white, radius: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(widget.data!.isFollow ? 'Following' : 'Follow', style: primaryTextStyle(color: widget.data!.isFollow ? white : appStore.textPrimaryColor)),
                                      8.width,
                                      Icon(Icons.keyboard_arrow_down, color: widget.data!.isFollow ? white : appStore.iconColor)
                                    ],
                                  )).onTap(() {}).expand(),
                              8.width,
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: boxDecoration(color: appDividerColor, bgColor: white, radius: 5.0),
                                child: Text(
                                  'Message',
                                  style: primaryTextStyle(),
                                  textAlign: TextAlign.center,
                                ),
                              ).onTap(() {}).expand(),
                              8.width,
                              Container(padding: EdgeInsets.all(8), decoration: boxDecoration(color: appDividerColor, bgColor: white, radius: 5.0), child: Icon(Icons.keyboard_arrow_down, color: appStore.iconColor).center()).onTap(() {})
                            ],
                          )
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
    );
  }
}
