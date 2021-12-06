import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/screens/SNSplashScreen.dart';
import 'package:photogram_flutter/store/AppStore.dart';
import 'package:photogram_flutter/utils/AppTheme.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';

AppStore appStore = AppStore();
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
          title: 'Photogram flutter',
          theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
          builder: scrollBehaviour(),
          debugShowCheckedModeBanner: false,
          home: SNSplashScreen(),
        );
      },
    );
  }
}
