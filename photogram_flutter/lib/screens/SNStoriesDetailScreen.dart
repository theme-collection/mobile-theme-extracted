import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:photogram_flutter/utils/SNImages.dart';

class SNStoriesDetailScreen extends StatefulWidget {
  static String tag = '/SNStoriesDetailScreen';
  final SNStoriesModel? model;

  SNStoriesDetailScreen({this.model});

  @override
  SNStoriesDetailScreenState createState() => SNStoriesDetailScreenState();
}

class SNStoriesDetailScreenState extends State<SNStoriesDetailScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    controller = AnimationController(duration: Duration(milliseconds: 3000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    animation?.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          commonCacheImageWidget(SNPost1, fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: LinearProgressIndicator(
                      value: animation!.value,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      backgroundColor: Colors.red,
                      minHeight: 2,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          finish(context);
                        },
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(top: 8, left: 8),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(widget.model!.img!, fit: BoxFit.cover),
                        ),
                      ),
                      8.width,
                      Text(widget.model!.name.validate(), style: primaryTextStyle(color: white, size: 20)),
                      8.width,
                      Text(widget.model!.time.validate(), style: primaryTextStyle(color: white))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: context.width(),
                      height: 40,
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Send message',
                          contentPadding: EdgeInsets.only(left: 16),
                          hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                          suffixIcon: Icon(Icons.more_vert, size: 25, color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.5),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.white, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                        ),
                      ),
                    ).expand(),
                    8.width,
                    Icon(Feather.send, color: Colors.white.withOpacity(0.5)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
