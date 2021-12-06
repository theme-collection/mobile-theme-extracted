import 'package:event_flutter/screens/EAExplorerScreen.dart';
import 'package:event_flutter/screens/EASearchPeopleScreen.dart';
import 'package:event_flutter/utils/EAColors.dart';
import 'package:event_flutter/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EAMayBEYouKnowScreen.dart';

class EAPeopleScreen extends StatefulWidget {
  @override
  EAPeopleScreenState createState() => EAPeopleScreenState();
}

class EAPeopleScreenState extends State<EAPeopleScreen> {
  final _kTabs = <Tab>[
    const Tab(text: 'MAYBE YOU KNOW'),
    const Tab(text: 'EXPLORER'),
  ];

  final _kTabPages = <Widget>[
    EAMayBEYouKnowScreen(),
    EAExplorerScreen(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'People',
        center: true,
        actions: [
          IconButton(
              onPressed: () {
                EASearchPeopleScreen().launch(context);
              },
              icon: const Icon(Icons.search, color: white))
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: context.width(),
                  child: Material(
                    color: Colors.white,
                    child: TabBar(
                      tabs: _kTabs,
                      indicatorColor: primaryColor1,
                      labelColor: primaryColor1,
                      unselectedLabelColor: grey,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    children: _kTabPages,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
