import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:photogram_flutter/components/ActivityComponent.dart';
import 'package:photogram_flutter/components/ProfileComponent.dart';
import 'package:photogram_flutter/screens/SNDashboardScreen.dart';
import 'package:photogram_flutter/screens/SNSearchScreen.dart';
import 'package:photogram_flutter/utils/SNImages.dart';

import '../../../main.dart';
import 'SNMediaScreen.dart';

class SNBottomNavigationScreen extends StatefulWidget {
  static String tag = '/SNBottomNaviScreen';

  @override
  SNBottomNavigationScreenState createState() => SNBottomNavigationScreenState();
}

class SNBottomNavigationScreenState extends State<SNBottomNavigationScreen> {
  int selectedIndex = 0;

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

  static final pages = <Widget>[
    SNDashboardScreen(),
    SNSearchScreen(),
    SNMediaScreen(),
    ActivityComponent(),
    ProfileComponent(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.teal,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Feather.home, color: selectedIndex == 0 ? appStore.iconColor : appStore.iconSecondaryColor), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Feather.search, color: selectedIndex == 1 ? appStore.iconColor : appStore.iconSecondaryColor), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Octicons.diff_added, color: selectedIndex == 2 ? appStore.iconColor : appStore.iconSecondaryColor), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Feather.heart, color: selectedIndex == 3 ? appStore.iconColor : appStore.iconSecondaryColor), title: Text('')),
            BottomNavigationBarItem(
                icon: Container(
                  height: 35,
                  width: 35,
                  padding: EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: Image.asset(SNProfile1, height: 25, width: 25, fit: BoxFit.cover),
                  ),
                ),
                title: Text('')),
          ],
        ),
      ),
    );
  }
}
