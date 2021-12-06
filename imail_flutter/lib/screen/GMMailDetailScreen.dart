import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:imail_flutter/main.dart';
import 'package:imail_flutter/model/GMModel.dart';
import 'package:imail_flutter/screen/GMComposeScreen.dart';
import 'package:imail_flutter/screen/GMDashboardScreen.dart';
import 'package:imail_flutter/utils/AppWidget.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:imail_flutter/utils/GMDataProvider.dart';
import 'package:imail_flutter/utils/GMImages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GMMailDetailScreen extends StatefulWidget {
  final GMMailModel? data;

  GMMailDetailScreen({this.data});

  @override
  _GMMailDetailScreenState createState() => _GMMailDetailScreenState();
}

class _GMMailDetailScreenState extends State<GMMailDetailScreen> {
  WebViewController? _webViewController;
  bool? _isChecked = false;
  List<GMSnoozeModel> snoozeList = getSnoozeGridList();

  double? contentHeight = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _webViewController = null;
    super.dispose();
  }

  _addToTaskDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Tips:Enjoy your Virus-free and secure download from official App Market',
              style: boldTextStyle(size: 16),
              maxLines: 3,
            ),
            contentPadding: EdgeInsets.all(16),
            actions: [
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  finish(context);
                },
              ),
              FlatButton(
                child: Text('Download Now'),
                onPressed: () {
                  finish(context);
                },
              ),
            ],
          );
        });
  }

  _moveToDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Move to', style: boldTextStyle(size: 20)),
            contentPadding: EdgeInsets.all(16),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    16.width,
                    Text('Social', style: primaryTextStyle()),
                  ],
                ).onTap(() {
                  toast('Move to Social', gravity: ToastGravity.BOTTOM);
                  finish(context);
                  socialList.add(widget.data);
                  finish(context);
                }),
                20.height,
                Row(
                  children: [
                    Icon(AntDesign.tago),
                    16.width,
                    Text('Promotions', style: primaryTextStyle()),
                  ],
                ).onTap(() {
                  toast('Move to Promotions', gravity: ToastGravity.BOTTOM);
                  finish(context);
                  promotionsList.add(widget.data);
                  finish(context);
                }),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  finish(context);
                },
              ),
            ],
          );
        });
  }

  _snoozeDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            content: Container(
              height: 340,
              width: context.width() * 0.7,
              child: GridView.builder(
                  itemCount: snoozeList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    GMSnoozeModel data = snoozeList[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(data.image, color: GMYellowColor),
                        16.height,
                        Text(data.day!, style: primaryTextStyle()),
                        4.height,
                        Text(data.time!, style: secondaryTextStyle(size: 12)),
                      ],
                    ).onTap(() {
                      toast('Add in Snooze', gravity: ToastGravity.BOTTOM);
                      finish(context);
                      snoozingList.add(widget.data);
                      finish(context);
                    });
                  }),
            ),
          );
        });
  }

  _reportToSpamDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Report spam & Unsubscribe', style: boldTextStyle()),
            contentPadding: EdgeInsets.all(16),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('This massage will be marked as spam.Would you also like to stop receiving similar messages from Bob proctor?'),
                Text('Learn more', style: boldTextStyle(color: GMBlueColor)),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Report spam & unsubscribe'),
                onPressed: () {
                  finish(context);
                },
              ),
              FlatButton(
                child: Text('Report spam'),
                onPressed: () {
                  finish(context);
                },
              )
            ],
          );
        });
  }

  _unsubscribeDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Unsubscribe', style: boldTextStyle(size: 20)),
            contentPadding: EdgeInsets.all(16),
            content: Text('Are you sure that you like to stop receiving similar message from Codementor'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  finish(context);
                },
              ),
              FlatButton(
                child: Text('Unsubscribe'),
                onPressed: () {
                  finish(context);
                },
              )
            ],
          );
        });
  }

  _changeLabelsDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Label as', style: boldTextStyle(size: 20)),
            contentPadding: EdgeInsets.all(16),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.inbox),
                    16.width,
                    Text('Inbox', style: primaryTextStyle()),
                  ],
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel', style: boldTextStyle(color: GMBlueColor)),
                onPressed: () {
                  finish(context);
                },
              ),
              FlatButton(
                child: Text('Ok', style: boldTextStyle(color: GMBlueColor)),
                onPressed: () {
                  finish(context);
                },
              )
            ],
          );
        });
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString("assets/emailClient/email_details.html");
    _webViewController!.loadUrl(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: GMWhiteColor,
        actions: [
          IconButton(icon: Icon(Icons.download_outlined, color: GMBlackColor, size: 22), onPressed: () {}),
          IconButton(icon: Icon(Icons.delete_outline, color: GMBlackColor, size: 22), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.mail_outline, color: GMBlackColor, size: 22),
              onPressed: () {
                GMDashboardScreen().launch(context);
              }),
          PopupMenuButton(
            onSelected: (dynamic v) {
              if (v == 1) {
                _snoozeDialog(context);
              } else if (v == 2) {
                _changeLabelsDialog(context);
              } else if (v == 4) {
                _unsubscribeDialog(context);
              } else if (v == 0) {
                _moveToDialog(context);
              } else if (v == 8) {
                _addToTaskDialog(context);
              } else if (v == 7) {
                _reportToSpamDialog(context);
              }
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(PopupMenuItem(child: Text('Move to', style: primaryTextStyle()), value: 0));
              list.add(PopupMenuItem(child: Text('Snooze', style: primaryTextStyle()), value: 1));
              list.add(PopupMenuItem(child: Text('Change labels', style: primaryTextStyle()), value: 2));
              list.add(PopupMenuItem(
                  child: Text('Mark as important', style: primaryTextStyle()).onTap(() {
                    toast('1 marked important', gravity: ToastGravity.BOTTOM);
                    finish(context);
                    importantList.add(widget.data);
                    finish(context);
                  }),
                  value: 3));
              list.add(PopupMenuItem(child: Text('Unsubscribe', style: primaryTextStyle()), value: 4));
              list.add(PopupMenuItem(child: Text('Mute', style: primaryTextStyle()), value: 5));
              list.add(PopupMenuItem(child: Text('Print', style: primaryTextStyle()), value: 6));
              list.add(PopupMenuItem(child: Text('Report spam', style: primaryTextStyle()), value: 7));
              list.add(PopupMenuItem(child: Text('Add to Tasks', style: primaryTextStyle()), value: 8));
              list.add(PopupMenuItem(child: Text('Help and Feedback', style: primaryTextStyle()), value: 9));
              return list;
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.data!.title.validate(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: primaryTextStyle(color: GMBlackColor, size: 20),
                ).expand(),
                8.width,
                widget.data!.ratting ? Icon(Icons.star, color: GMGreyColor, size: 20) : Icon(Icons.star_border, color: GMGreyColor, size: 20),
              ],
            ),
            20.height,
            Row(
              children: [
                CircleAvatar(child: Text(widget.data!.name![0], style: boldTextStyle(size: 20, color: white)), backgroundColor: Colors.blue),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(widget.data!.name!, style: boldTextStyle(size: 16)),
                      5.width,
                      Text(widget.data!.dateTime!, style: boldTextStyle(size: 12, color: grey)),
                    ]),
                    Row(children: [Text("to me"), Icon(Icons.keyboard_arrow_down)]),
                  ],
                ).expand(),
                Image.asset(GMReplyIcon, height: 20, width: 20).onTap(() {
                  GMComposeScreen(accountModel: widget.data, sendingType: "Reply").launch(context);
                }),
                10.width,
                Container(
                  height: 30,
                  width: 30,
                  child: PopupMenuButton(
                    onSelected: (dynamic val) {
                      if (val == 0) GMComposeScreen(accountModel: widget.data, sendingType: "Reply all").launch(context);
                      if (val == 1) GMComposeScreen(accountModel: widget.data, sendingType: "Forward").launch(context);
                      if (val == 2)
                        setState(() {
                          widget.data!.ratting = !widget.data!.ratting;
                        });
                      if (val == 3) toast("coming soon");
                      if (val == 4) toast("coming soon");
                      if (val == 5) toast("coming soon");
                    },
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context) {
                      List<PopupMenuEntry<Object>> list = [];
                      list.add(PopupMenuItem(child: Text('Reply all', style: primaryTextStyle()), value: 0));
                      list.add(PopupMenuItem(child: Text('Forward', style: primaryTextStyle()), value: 1));
                      list.add(PopupMenuItem(child: Text(widget.data!.ratting ? 'Remove star' : 'Add star', style: primaryTextStyle()), value: 2));
                      list.add(PopupMenuItem(child: Text('Print', style: primaryTextStyle()), value: 3));
                      list.add(PopupMenuItem(child: Text('Mark unread from here', style: primaryTextStyle()), value: 4));
                      list.add(PopupMenuItem(child: Text('Block \"${widget.data!.name}\"', style: primaryTextStyle()), value: 5));
                      return list;
                    },
                  ),
                )
              ],
            ),
            20.height,
            Container(
              height: contentHeight != null ? contentHeight : 300,
              child: WebView(
                initialUrl: "about:blank",
                onWebViewCreated: (WebViewController webViewController) async {
                  _webViewController = webViewController;
                  double height = double.parse(await _webViewController!.evaluateJavascript("document.documentElement.scrollHeight;"));
                  _loadHtmlFromAssets();
                  print("Height is $height");
                  //setState(() {contentHeight = height;});
                },
                onPageFinished: (_) async {
                  if (_webViewController != null) {
                    contentHeight = double.tryParse(await _webViewController!.evaluateJavascript("document.documentElement.scrollHeight;"));
                    //print("Height : $contentHeight");
                    setState(() {});
                  }
                },
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: boxDecoration(color: Colors.grey.withOpacity(0.4), radius: 5),
                  child: Row(
                    children: [Icon(FontAwesome.mail_reply, size: 16, color: Colors.blueGrey), 10.width, Text("Reply")],
                  ),
                ).onTap(() {
                  GMComposeScreen(accountModel: widget.data, sendingType: "Reply").launch(context);
                }),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: boxDecoration(color: Colors.grey.withOpacity(0.4), radius: 5),
                  child: Row(
                    children: [Icon(FontAwesome.mail_reply_all, size: 16, color: Colors.blueGrey), 10.width, Text("Reply all")],
                  ),
                ).onTap(() {
                  GMComposeScreen(accountModel: widget.data, sendingType: "Reply all").launch(context);
                }),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: boxDecoration(color: Colors.grey.withOpacity(0.4), radius: 5),
                  child: Row(
                    children: [Icon(FontAwesome.mail_forward, size: 16, color: Colors.blueGrey), 10.width, Text("Forward")],
                  ),
                ).onTap(() {
                  GMComposeScreen(accountModel: widget.data, sendingType: "Forward").launch(context);
                })
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
