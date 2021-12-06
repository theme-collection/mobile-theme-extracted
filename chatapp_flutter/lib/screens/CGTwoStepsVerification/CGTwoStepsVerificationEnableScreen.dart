import 'package:chatapp_flutter/screens/CGTwoStepsVerification/CGTwoStepsVerificationPWDScreen.dart';
import 'package:chatapp_flutter/utils/CGConstant.dart';
import 'package:chatapp_flutter/utils/CGWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGTwoStepsVerificationEnable extends StatefulWidget {
  @override
  _CGTwoStepsVerificationEnableState createState() => _CGTwoStepsVerificationEnableState();
}

class _CGTwoStepsVerificationEnableState extends State<CGTwoStepsVerificationEnable> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Two-step verification") as PreferredSizeWidget?,
        body: Container(
            padding: EdgeInsets.only(top: CGAppPadding, right: CGAppPadding, left: CGAppPadding, bottom: 8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                CircleAvatar(backgroundImage: NetworkImage("https://icons-for-free.com/iconfiles/png/512/green+lock+privacy+safe+secure+security+icon-1320196713520107078.png"), radius: 50.0),
                18.height,
                Text(
                  "For added security, enable two-step verification, which will require a PIN when registering your phone number with $CGAppName again",
                  style: TextStyle(fontSize: 16),
                )
              ]),
              RaisedButton(
                  onPressed: () {
                    CGTwoStepsVerificationPwdScreen().launch(context);
                  },
                  child: Text("ENABLE", style: TextStyle(color: Colors.white)),
                  color: Colors.green)
            ])),
      ),
    );
  }
}
