import 'package:chatapp_flutter/model/CGChatModel.dart';
import 'package:chatapp_flutter/utils/CGColors.dart';
import 'package:chatapp_flutter/utils/CGDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGCallScreen extends StatefulWidget {
  const CGCallScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CGCallScreenState createState() => _CGCallScreenState();
}

class _CGCallScreenState extends State<CGCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: 30,
        padding: EdgeInsets.only(top: 8, bottom: 80),
        itemBuilder: (BuildContext context, int index) {
          ChatModel data = chats[index % chats.length];

          return Container(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: Row(
              children: [
                Image.network(data.sender!.avatarUrl.validate(), width: 50).cornerRadiusWithClipRRect(30),
                15.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.sender!.name.validate(), style: boldTextStyle()),
                    5.height,
                    Row(
                      children: [
                        Icon(Icons.call_made, color: Colors.green, size: 16).visible(
                          data.callConnect!,
                          defaultWidget: Icon(Icons.call_received, color: Colors.red, size: 16),
                        ),
                        5.width,
                        Text('November 2 ${data.time.validate()}'),
                      ],
                    ),
                  ],
                ).expand(),
                IconButton(icon: Icon(Icons.videocam_rounded, color: secondaryColor), onPressed: () {}).visible(data.callRecived!, defaultWidget: IconButton(icon: Icon(Icons.call, color: secondaryColor), onPressed: () {})),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => Divider(height: 20),
      ),
    );
  }
}
