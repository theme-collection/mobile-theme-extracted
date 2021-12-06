import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imail_flutter/components/DashboardComponent.dart';
import 'package:imail_flutter/components/SearchMailComponent.dart';
import 'package:imail_flutter/main.dart';
import 'package:imail_flutter/model/GMModel.dart';
import 'package:imail_flutter/screen/GMComposeScreen.dart';
import 'package:imail_flutter/utils/AppColors.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:imail_flutter/utils/GMConstants.dart';
import 'package:imail_flutter/utils/GMDataProvider.dart';
import 'package:imail_flutter/utils/GMImages.dart';
import 'package:nb_utils/nb_utils.dart';

class GMDashboardScreen extends StatefulWidget {
  final String? title;
  final List<GMMailModel>? data;

  GMDashboardScreen({this.title, this.data});

  @override
  _GMDashboardScreenState createState() => _GMDashboardScreenState();
}

class _GMDashboardScreenState extends State<GMDashboardScreen> {
  List<GMMailModel?> mailList = getDashboardList();

  String? name = "Primary";
  List<GMSnoozeModel> multiSelectSnoozeList = getMultiSelectSnoozeGridList();

  final bool isExtended = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _scrollListener() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
        setState(() {});
      }
      if (_scrollController.offset <= _scrollController.position.minScrollExtent && !_scrollController.position.outOfRange) {
        setState(() {});
      }
    }

    _scrollController.addListener(_scrollListener);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    List<DrawerModel> getDrawer = getDrawerList(context);

    return SafeArea(
      child: Scaffold(
        key: drawerKey,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(GMAppName, style: boldTextStyle(color: GMRedColor, size: 20)),
              ),
              Divider(color: appDividerColor),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: getDrawer.length,
                itemBuilder: (context, index) {
                  DrawerModel data = getDrawer[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          leading: data.leading ?? 0.height,
                          dense: true,
                          title: Text(data.title.validate(), style: boldTextStyle(color: GMBlackColor, size: 14)),
                          trailing: data.trailing ?? 0.height,
                          onTap: () {
                            if (data.screenName == null && data.list == null) {
                              toast('Coming soon');
                            } else if (data.screenName == null) {
                              mailList.clear();
                              mailList.addAll(data.list!);
                              name = data.title;
                              setState(() {});
                              finish(context);
                            } else {
                              finish(context);
                              data.screenName.launch(context);
                            }
                          }),
                      Divider(color: appDividerColor).visible(index == 0 || index == 16),
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                        child: Text('ALL LABELS', style: boldTextStyle(size: 16)),
                      ).visible(index == 4),
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                        child: Text('GOOGLE APPS', style: boldTextStyle(color: GMBlackColor, size: 16)),
                      ).visible(index == 14),
                    ],
                  );
                },
              ),
              20.height,
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchMailComponent().paddingOnly(left: 16, right: 16, bottom: 16),
              _mailContent(name, mailList),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            GMComposeScreen().launch(context);
          },
          label: AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) => FadeTransition(
              opacity: animation,
              child: SizeTransition(
                child: child,
                sizeFactor: animation,
                axis: Axis.horizontal,
              ),
            ),
            child: isExtended
                ? Icon(
                    Icons.edit,
                    color: GMRedColor,
                  )
                : Row(
                    children: [
                      Icon(Icons.edit_outlined, color: GMRedColor).paddingOnly(right: 8),
                      Text("Compose", style: boldTextStyle(color: GMRedColor, size: 14)),
                    ],
                  ),
          ),
          backgroundColor: GMWhiteColor,
        ),
      ),
    );
  }

  Widget _mailContent(String? name, List<GMMailModel?> getMailList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name.validate().toUpperCase(),
          style: primaryTextStyle(),
        ).paddingOnly(left: 16),
        Stack(
          children: [
            DashBoardListComponent(getMailList: getMailList),
            Image.asset(GMNoData).center().visible(getMailList.isEmpty),
          ],
        )
      ],
    );
  }
}
