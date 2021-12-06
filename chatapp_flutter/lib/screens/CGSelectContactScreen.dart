import 'package:chatapp_flutter/model/CGChatModel.dart';
import 'package:chatapp_flutter/model/CGUserModel.dart';
import 'package:chatapp_flutter/screens/CGMessageScreen.dart';
import 'package:chatapp_flutter/screens/CGNewGroupAndBroadcastScreen.dart';
import 'package:chatapp_flutter/screens/CGqrScanScreen.dart';
import 'package:chatapp_flutter/utils/CGColors.dart';
import 'package:chatapp_flutter/utils/CGConstant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGSelectContactScreen extends StatefulWidget {
  ChatModel? data;
  final bool? isCallScreen;

  CGSelectContactScreen({this.isCallScreen});

  @override
  _CGSelectContactScreenState createState() => _CGSelectContactScreenState();
}

class _CGSelectContactScreenState extends State<CGSelectContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                finish(context);
              }),
          backgroundColor: secondaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select contact", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                "${fav.length} Contacts",
                style: boldTextStyle(size: 14, color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
            PopupMenuButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                itemBuilder: (context) => [PopupMenuItem(value: 1, child: Text("Invite a friend")), PopupMenuItem(value: 2, child: Text("Contacts")), PopupMenuItem(value: 3, child: Text("Refresh")), PopupMenuItem(value: 4, child: Text("Help"))])
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(CGAppPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    CGNewGroupAndBroadcastScreen(isNewGroup: true).launch(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(child: Icon(Icons.group, color: Colors.white, size: 28.0), radius: 24, backgroundColor: secondaryColor),
                        18.width,
                        Text(widget.isCallScreen! ? "New group call" : "New group", style: boldTextStyle(size: 18))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(child: Icon(Icons.group, color: Colors.white, size: 28.0), radius: 24, backgroundColor: secondaryColor),
                          18.width,
                          Text("New contact", style: boldTextStyle(size: 18)),
                        ],
                      ),
                      IconButton(
                          icon: Icon(Icons.qr_code, color: secondaryColor),
                          onPressed: () {
                            CGqrScanScreen().launch(context);
                          })
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: fav.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          finish(context);
                          CGMessageScreen(user: User(id: index, avatarUrl: fav[index].avatarUrl, name: fav[index].name)).launch(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(backgroundImage: NetworkImage(fav[index].avatarUrl!), radius: 24, backgroundColor: secondaryColor),
                                  18.width,
                                  Text(fav[index].name!, style: boldTextStyle(size: 18)),
                                ],
                              ),
                              if (widget.isCallScreen!)
                                Row(
                                  children: [
                                    IconButton(onPressed: () {}, icon: Icon(Icons.call, color: secondaryColor)),
                                    IconButton(onPressed: () {}, icon: Icon(Icons.videocam, color: secondaryColor)),
                                  ],
                                )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
