import 'dart:async';

import 'package:chatapp_flutter/model/CGUserModel.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGShowStoryScreen extends StatefulWidget {
  final User? storyData;

  CGShowStoryScreen({this.storyData});

  @override
  _CGShowStoryScreenState createState() => _CGShowStoryScreenState();
}

class _CGShowStoryScreenState extends State<CGShowStoryScreen> {
  double percent = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: _storyImagePreview()),
    );
  }

  _storyImagePreview() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("images/cloneApp/whatsApp/Whatsapp-Wallpaper-2.jpg", fit: BoxFit.cover),
        Positioned(top: 20, right: 0, child: PopupMenuButton<int>(icon: Icon(Icons.more_vert, color: Colors.white), itemBuilder: (context) => [PopupMenuItem(value: 1, child: Text("Mute"))])),
        Positioned(
            top: 5,
            child: Container(
                padding: EdgeInsets.only(left: 4, right: 4),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: LinearProgressIndicator(
                    minHeight: 3,
                    backgroundColor: Colors.black38,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    value: percent,
                  ),
                ))),
        Positioned(
            top: 15,
            child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            _timer.cancel();
                            finish(context, true);
                          }),
                      Image.network(widget.storyData!.avatarUrl!, width: 50).cornerRadiusWithClipRRect(30),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.storyData!.name!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                          Text("Today, 03:45 pm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                        ],
                      )
                    ]),
                  ],
                ))),
        Positioned(bottom: 18, right: 0, left: 0, child: Column(children: [Icon(Icons.keyboard_arrow_up, color: Colors.white), Text("Replay", style: boldTextStyle(size: 14, color: Colors.white))])),
      ],
    );
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 5), (timer) {
      setState(() {
        percent += 0.003;
        if (percent > 1) {
          _timer.cancel();
          finish(context, true);
        }
      });
    });
  }
}
