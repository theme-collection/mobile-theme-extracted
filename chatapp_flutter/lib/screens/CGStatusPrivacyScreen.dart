import 'package:chatapp_flutter/screens/CGStatusPrivacy/CGStatusPrivacyExceptContact.dart';
import 'package:chatapp_flutter/screens/CGStatusPrivacy/CGStatusPrivacyShareStatusContact.dart';
import 'package:chatapp_flutter/utils/CGColors.dart';
import 'package:chatapp_flutter/utils/CGConstant.dart';
import 'package:chatapp_flutter/utils/CGWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGStatusPrivacyScreen extends StatefulWidget {
  int? statusGroupItem = 1;

  @override
  _CGStatusPrivacyScreenState createState() => _CGStatusPrivacyScreenState();
}

class _CGStatusPrivacyScreenState extends State<CGStatusPrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Status privacy") as PreferredSizeWidget?,
        body: Container(
          padding: EdgeInsets.all(CGAppPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Who can see my status updates", style: boldTextStyle(color: secondaryColor, size: 14)),
                    Row(children: [
                      Radio(
                        activeColor: secondaryColor,
                        onChanged: (dynamic val) {
                          widget.statusGroupItem = val;
                          setState(() {});
                        },
                        groupValue: widget.statusGroupItem,
                        value: 1,
                      ),
                      Text("My Contact")
                    ]),
                    InkWell(
                      onTap: () {
                        setState(() {});
                        widget.statusGroupItem = 2;
                        CGStatusPrivacyExceptContact().launch(context);
                      },
                      child: Row(children: [
                        Radio(
                          activeColor: secondaryColor,
                          onChanged: (dynamic val) {
                            widget.statusGroupItem = val;
                            setState(() {});
                            CGStatusPrivacyExceptContact().launch(context);
                          },
                          groupValue: widget.statusGroupItem,
                          value: 2,
                        ),
                        Text("My contact except...")
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {});
                        widget.statusGroupItem = 3;
                        CGStatusPrivacyShareStatusContact().launch(context);
                      },
                      child: Row(children: [
                        Radio(
                          activeColor: secondaryColor,
                          onChanged: (dynamic val) {
                            widget.statusGroupItem = val;
                            setState(() {});
                          },
                          groupValue: widget.statusGroupItem,
                          value: 3,
                        ),
                        Text("Only share with...")
                      ]),
                    ),
                    Text("Changes to your privacy setting won't affect status updates that you've sent already")
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  finish(context);
                  toast("setting updated", gravity: ToastGravity.CENTER);
                },
                child: Text("DONE", style: TextStyle(color: Colors.white)),
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
