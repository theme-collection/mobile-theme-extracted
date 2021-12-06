import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/components/MessageComponent.dart';
import 'package:photogram_flutter/main.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/screens/SNChatDetailScreen.dart';

class SNChatScreen extends StatefulWidget {
  static String tag = '/SNChatScreen';

  final SNChatModel? data;

  SNChatScreen({this.data});

  @override
  SNChatScreenState createState() => SNChatScreenState();
}

class SNChatScreenState extends State<SNChatScreen> {
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
      appBar: AppBar(
        title: Row(
          children: [
            Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.bottomRight,
              children: <Widget>[
                CircleAvatar(backgroundImage: AssetImage(widget.data!.img!), radius: 22),
                Positioned(top: 12, left: 14, child: Icon(Entypo.dot_single, color: widget.data!.isActive ? Colors.green : Colors.transparent, size: 45)),
              ],
            ),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.data!.name.validate(), style: boldTextStyle(size: 14)),
                Text(widget.data!.time.validate(), style: primaryTextStyle(size: 14, color: appStore.textSecondaryColor)),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam_outlined, size: 35),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.info_outlined, size: 30),
            onPressed: () {
              SNChatDetailScreen(data: widget.data).launch(context);
            },
          ),
        ],
      ),
      body: MessageComponent(),
    );
  }
}
