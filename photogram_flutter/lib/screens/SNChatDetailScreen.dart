import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNColors.dart';

class SNChatDetailScreen extends StatefulWidget {
  static String tag = '/SNChatDetailScreen';

  final SNChatModel? data;

  SNChatDetailScreen({this.data});

  @override
  SNChatDetailScreenState createState() => SNChatDetailScreenState();
}

class SNChatDetailScreenState extends State<SNChatDetailScreen> {
  bool isMuteMsg = false;
  bool isVideoChat = false;

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
    return Scaffold(
      appBar: appBar(context, 'Details') as PreferredSizeWidget?,
      body: Responsive(
        web: Container(),
        mobile: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mute Messages', style: primaryTextStyle()),
                  Switch(
                    value: isMuteMsg,
                    onChanged: (value) {
                      setState(() {
                        isMuteMsg = value;
                      });
                    },
                    activeTrackColor: Colors.blueAccent,
                    activeColor: Colors.white,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mute Video Chats', style: primaryTextStyle()),
                  Switch(
                    value: isVideoChat,
                    onChanged: (value) {
                      setState(() {
                        isVideoChat = value;
                      });
                    },
                    activeTrackColor: Colors.blueAccent,
                    activeColor: Colors.white,
                  ),
                ],
              ),
              16.height,
              Text('Members', style: boldTextStyle()),
              16.height,
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(widget.data!.img!), radius: 25),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.data!.name!, style: boldTextStyle()),
                      Text(widget.data!.nickName!, style: primaryTextStyle()),
                    ],
                  ).expand(),
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(color: colorBlue, borderRadius: BorderRadius.circular(5), boxShadow: defaultBoxShadow()),
                    child: Text('Follow', style: primaryTextStyle(color: white)),
                  ).onTap(() {
                    finish(context);
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
