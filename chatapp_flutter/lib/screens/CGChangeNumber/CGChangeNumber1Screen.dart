import 'package:chatapp_flutter/screens/CGChangeNumber/CGChangeNumber2Screen.dart';
import 'package:chatapp_flutter/utils/CGConstant.dart';
import 'package:chatapp_flutter/utils/CGWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGChangeNumber extends StatefulWidget {
  @override
  _CGChangeNumberState createState() => _CGChangeNumberState();
}

class _CGChangeNumberState extends State<CGChangeNumber> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Change number") as PreferredSizeWidget?,
        body: Container(
          padding: EdgeInsets.only(left: CGAppPadding, right: CGAppPadding, top: CGAppPadding, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn0.iconfinder.com/data/icons/technology-business-and-people/1000/file_light-21-512.png"),
                      radius: 100,
                    ),
                    18.height,
                    Text("Change your phone number will migrate your account info, group & settings.", style: TextStyle(fontSize: 16)),
                    8.height,
                    Text("Before proceeding, please confirm that your are able to receive SMS or calls at your new number.", style: TextStyle(fontSize: 14, color: Colors.grey)),
                    8.height,
                    Text("If you have both new phone and new number, first change your number on your old phone.", style: TextStyle(fontSize: 14, color: Colors.grey))
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  finish(context);
                  CGChangeNumber2().launch(context);
                },
                child: Text("NEXT", style: TextStyle(color: Colors.white)),
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
