import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/components/MessageComponent.dart';

import '../../../main.dart';

class ChatComponent extends StatefulWidget {
  static String tag = '/ChatComponent';

  @override
  ChatComponentState createState() => ChatComponentState();
}

class ChatComponentState extends State<ChatComponent> {
  List<SNChatModel> chats = getChatData();
  String? personName = '';

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
    return ListView.separated(
      separatorBuilder: (_, i) => Divider(),
      padding: EdgeInsets.all(8),
      itemCount: chats.length,
      itemBuilder: (_, index) {
        SNChatModel data = chats[index];

        return GestureDetector(
          onTap: () {
            if (context.width() > 540 && !isMobile) {
              personName = data.name;
              MessageComponent(personName: personName);
              setState(() {});
            } else {
              personName = data.name;
              MessageComponent(personName: personName);
            }
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(data.img!, height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                10.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!, style: primaryTextStyle(color: appStore.textPrimaryColor)).expand(),
                          Text(data.time!, style: secondaryTextStyle(size: 12, color: appStore.textSecondaryColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(data.lastMsg!, style: secondaryTextStyle(size: 12), maxLines: 1).expand(),
                          2.width,
                          Row(
                            children: [
                              Icon(Icons.done_all, color: Colors.red.withOpacity(0.85), size: 14).withHeight(14),
                              2.width,
                              Container(
                                decoration: BoxDecoration(color: Colors.red.withOpacity(0.85), shape: BoxShape.circle),
                                child: Text(data.unreadCount.toString(), style: secondaryTextStyle(color: white, size: 10), maxLines: 1).paddingAll(6),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
