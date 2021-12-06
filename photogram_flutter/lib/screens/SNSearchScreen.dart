import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/components/SearchComponent.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

import '../../../main.dart';

class SNSearchScreen extends StatefulWidget {
  static String tag = '/SNSearchScreen';

  @override
  SNSearchScreenState createState() => SNSearchScreenState();
}

class SNSearchScreenState extends State<SNSearchScreen> {
  List<String> typeList = ['IGTV', 'Shop', 'Well-being', 'Travel', 'Architecture', 'Decor', 'Art', 'Food', 'Style', 'DIY', 'Music', 'Sports', 'Beauty'];
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
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(border: InputBorder.none, hintText: 'Search', hintStyle: primaryTextStyle(), prefixIcon: Icon(Icons.search)),
                    onTap: () {
                      hideKeyboard(context);
                      SearchComponent().launch(context);
                    },
                  ).expand(),
                  Icon(AntDesign.scan1, color: appStore.iconColor).onTap(() {}),
                ],
              ).paddingRight(8),
              8.height,
              Container(
                height: 45,
                child: ListView.builder(
                  itemCount: typeList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: appStore.scaffoldBackground,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Text(typeList[index], style: primaryTextStyle(size: 14), textAlign: TextAlign.center),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Responsive(
          web: Container(),
          mobile: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: maxItemCount,
            padding: EdgeInsets.only(bottom: 50),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              SNPostModel data = postList[index % postList.length];
              return Stack(
                children: [commonCacheImageWidget(data.userImg, fit: BoxFit.cover, height: 200, width: 200)],
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
          ),
        ),
      ),
    );
  }
}
