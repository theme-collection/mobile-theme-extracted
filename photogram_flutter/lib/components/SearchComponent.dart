import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/screens/SNUserInfoScreen.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

import '../../../main.dart';

class SearchComponent extends StatefulWidget {
  static String tag = '/SearchComponent';

  @override
  SearchComponentState createState() => SearchComponentState();
}

class SearchComponentState extends State<SearchComponent> {
  List<String> typeList = ['TOP', 'ACCOUNT', 'TAGS', 'PLACES'];
  List<Widget> tabs = [];
  List<SNSearchModel> searchList = getSearchList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    typeList.forEach((element) {
      tabs.add(
        Container(
          padding: EdgeInsets.all(16.0),
          child: Text(element.validate(), style: secondaryTextStyle(color: appStore.textSecondaryColor)),
        ),
      );
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget listView() {
      return Container(
        width: context.width(),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: maxItemCount,
          padding: EdgeInsets.all(8),
          itemBuilder: (_, index) {
            SNSearchModel data = searchList[index % searchList.length];
            return Container(
              margin: EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(data.userImg!),
                    radius: 30,
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(data.name!, style: boldTextStyle(size: 16)),
                          8.width,
                          Icon(Octicons.verified, color: Colors.blueAccent, size: 15).visible(data.isVerifyAccount),
                        ],
                      ),
                      Text(data.subTitle!, style: secondaryTextStyle(size: 14))
                    ],
                  )
                ],
              ),
            ).onTap(() {
              SNUserInfoScreen(data: data).launch(context);
            });
          },
        ),
      );
    }

    return DefaultTabController(
      length: typeList.length,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appStore.scaffoldBackground,
            title: Container(
              width: context.width(),
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none, hintText: 'Search', hintStyle: primaryTextStyle(), prefixIcon: Icon(Icons.search)),
              ),
            ),
            bottom: TabBar(
              labelPadding: EdgeInsets.only(left: 0, right: 0),
              indicatorWeight: 4.0,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: appStore.iconColor,
              isScrollable: false,
              tabs: tabs,
              onTap: (i) {},
            ),
          ),
          body: TabBarView(
            children: [
              listView(),
              listView(),
              listView(),
              listView(),
            ],
          ),
        ),
      ),
    );
  }
}
