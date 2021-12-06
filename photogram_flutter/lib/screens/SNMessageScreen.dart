import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/main.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/screens/SNChatScreen.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';

class SNMessageScreen extends StatefulWidget {
  static String tag = '/SNMessageScreen';

  @override
  SNMessageScreenState createState() => SNMessageScreenState();
}

class SNMessageScreenState extends State<SNMessageScreen> {
  var searchCont = TextEditingController();

  List<SNAccountModel> accountList = getAccountList();
  List<SNChatModel> msgList = getChatData();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Username, style: boldTextStyle()),
            Icon(Icons.keyboard_arrow_down),
          ],
        ).onTap(() {
          accounts(context, accountList);
        }),
        actions: [
          Icon(Icons.videocam, size: 30).onTap(() {}),
          16.width,
          Icon(Feather.edit, size: 20).onTap(() {}),
          16.width,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            TextField(
              controller: searchCont,
              style: primaryTextStyle(),
              cursorColor: appStore.iconColor,
              decoration: InputDecoration(
                hintText: searchHintText,
                contentPadding: EdgeInsets.all(8),
                hintStyle: secondaryTextStyle(),
                prefixIcon: Icon(Icons.search, color: appStore.iconSecondaryColor),
                fillColor: white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: appStore.iconSecondaryColor!, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: appStore.iconSecondaryColor!, width: 0.5),
                ),
              ),
            ),
            16.height,
            Text(Messages, style: boldTextStyle()),
            16.height,
            ListView.builder(
              itemCount: maxItemCount,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                SNChatModel data = msgList[index % msgList.length];
                return MessageItemWidget(data);
              },
            ),
          ],
        ).paddingAll(12),
      ),
    );
  }
}

class MessageItemWidget extends StatefulWidget {
  static String tag = '/MessageItem';
  final SNChatModel data;

  MessageItemWidget(this.data);

  @override
  MessageItemWidgetState createState() => MessageItemWidgetState();
}

class MessageItemWidgetState extends State<MessageItemWidget> {
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
    return GestureDetector(
      onTap: () {
        SNChatScreen(data: widget.data).launch(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.bottomRight,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey, width: 2)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.asset(widget.data.img!, height: 50, width: 50, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 20,
                  child: Icon(Entypo.dot_single, color: widget.data.isActive ? Colors.green : Colors.transparent, size: 60),
                ),
              ],
            ),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.data.name!, style: primaryTextStyle(size: 18)),
                4.height,
                Text(widget.data.lastMsg!, style: secondaryTextStyle(), maxLines: 2),
                4.height,
                Text(widget.data.time!, style: secondaryTextStyle()),
              ],
            ).expand(),
            Icon(Feather.camera, color: appStore.iconSecondaryColor),
          ],
        ),
      ),
    );
  }
}
