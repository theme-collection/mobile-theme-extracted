import 'package:camera/camera.dart';
import 'package:chatapp_flutter/screens/CGSplashScreen.dart';
import 'package:chatapp_flutter/store/AppStore.dart';
import 'package:chatapp_flutter/utils/AppTheme.dart';
import 'package:chatapp_flutter/utils/CGConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

AppStore appStore = AppStore();

int setWallpaper = 0;
late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  appStore.toggleDarkMode(value: await getBool(isDarkModeOnPref, defaultValue: false));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          title: 'PlayStore flutter',
          theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
          builder: scrollBehaviour(),
          debugShowCheckedModeBanner: false,
          home: CGSplashScreen(),
        );
      },
    );
  }
}
