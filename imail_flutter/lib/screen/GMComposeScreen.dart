import 'package:flutter/material.dart';
import 'package:imail_flutter/model/GMModel.dart';
import 'package:imail_flutter/screen/GMDashboardScreen.dart';
import 'package:imail_flutter/screen/GMSettingScreen.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:imail_flutter/utils/GMDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import 'GmConfidentialScreen.dart';

class GMComposeScreen extends StatefulWidget {
  final GMMailModel? accountModel;
  final String? sendingType;

  const GMComposeScreen({Key? key, this.accountModel, this.sendingType}) : super(key: key);

  @override
  _GMComposeScreenState createState() => _GMComposeScreenState();
}

class _GMComposeScreenState extends State<GMComposeScreen> {
  String fromPersonMailId = 'lee@gmail.com';
  bool isExpanded = false;

  var ccCont = TextEditingController();
  var bCCCont = TextEditingController();
  var toCont = TextEditingController();
  var subjectCont = TextEditingController();
  var composeMailCont = TextEditingController();

  List<GMSnoozeModel> scheduleList = getScheduleGridList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void _senderConfirmDialog() async {
    String error = '';
    if (toCont.text.trim().isEmpty) {
      error = 'Add at least one recipient';
    }

    if (error.isNotEmpty) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            content: Text(error, style: primaryTextStyle()),
            actions: [
              FlatButton(
                onPressed: () {
                  finish(context);
                },
                child: Text('OK', style: primaryTextStyle(color: GMBlueColor)),
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }

  void _scheduleSendDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          contentPadding: EdgeInsets.fromLTRB(0, 16, 16, 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Container(
            width: context.width() * 0.7,
            height: 260,
            child: GridView.builder(
              itemCount: scheduleList.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                GMSnoozeModel data = scheduleList[index];
                return Column(
                  children: [
                    IconButton(icon: Icon(data.image, color: GMYellowColor), onPressed: () {}),
                    Text(data.day!, style: primaryTextStyle()),
                    4.height,
                    Text(data.time!, style: secondaryTextStyle(size: 12)),
                  ],
                ).onTap(() {
                  finish(context);
                  _senderConfirmDialog();
                });
              },
            ),
          ),
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.accountModel != null) {
      if (widget.sendingType == "Forward") {
        subjectCont.text = "Fwd: ${widget.accountModel!.title}";
      } else {
        subjectCont.text = "Re: ${widget.accountModel!.title}";
      }
    }
    if (widget.sendingType == 'Reply' || widget.sendingType == 'Reply all') {
      toCont.text = "john@gmail.com";
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            finish(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: GMWhiteColor,
        title: !widget.sendingType.isEmptyOrNull ? Text(widget.sendingType!, style: primaryTextStyle(color: GMBlackColor, size: 18)) : Text('Compose', style: primaryTextStyle(color: GMBlackColor, size: 18)),
        titleSpacing: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.attachment, size: 22),
            onPressed: () {
              _showPopupMenu();
            },
          ),
          IconButton(
            icon: Icon(Icons.send, size: 22),
            onPressed: () {
              _senderConfirmDialog();
            },
          ),
          PopupMenuButton(
            onSelected: (dynamic v) {
              if (v == 6) {
                GMSettingScreen().launch(context);
              } else if (v == 3) {
                GmConfidentialScreen().launch(context);
              } else if (v == 1) {
                _scheduleSendDialog();
              } else if (v == 5) {
                toast('Message discarded');
                GMDashboardScreen().launch(context);
              } else if (v == 4) {
                toast('Message saved as draft');
                draftList.add(GMMailModel(name: 'Draft', title: subjectCont.text, description: composeMailCont.text, dateTime: '9:51 am'));
              }
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(PopupMenuItem(child: Text('Schedule Send', style: primaryTextStyle()), value: 1));
              list.add(PopupMenuItem(child: Text('Add from Contacts', style: primaryTextStyle()), value: 2));
              list.add(PopupMenuItem(child: Text('Confidential mode', style: primaryTextStyle()), value: 3));
              list.add(PopupMenuItem(child: Text('Save draft', style: primaryTextStyle()), value: 4));
              list.add(PopupMenuItem(child: Text('Discard', style: primaryTextStyle()), value: 5));
              list.add(PopupMenuItem(child: Text('Settings', style: primaryTextStyle()), value: 6));
              list.add(PopupMenuItem(child: Text('help & feedback', style: primaryTextStyle()), value: 7));

              return list;
            },
          ).paddingTop(8)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Row(
                  children: [
                    Text('From', style: primaryTextStyle(color: GMGreyColor)),
                    8.width,
                    TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: fromPersonMailId),
                      style: primaryTextStyle(size: 16, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GMWhiteColor,
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                      ),
                    ).expand(),
                  ],
                ).expand(),
                PopupMenuButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: GMGreyColor),
                  onSelected: (dynamic v) {
                    if (v == 1) {
                      fromPersonMailId = 'lee@gmail.com';
                    } else if (v == 2) {
                      fromPersonMailId = 'john@gmail.com';
                    } else {
                      fromPersonMailId = 'mark@gmail.com';
                    }
                    setState(() {});
                  },
                  itemBuilder: (BuildContext context) {
                    List<PopupMenuEntry<Object>> list = [];
                    list.add(PopupMenuItem(child: Text("lee@gmail.com", style: primaryTextStyle()), value: 1));
                    list.add(PopupMenuItem(child: Text("john@gmail.com", style: primaryTextStyle()), value: 2));
                    list.add(PopupMenuItem(child: Text("mark@gmail.com", style: primaryTextStyle()), value: 3));
                    return list;
                  },
                )
              ],
            ),
            Divider(color: GMAppDividerColor),
            Row(
              children: [
                Row(
                  children: [
                    Text('To', style: primaryTextStyle(color: GMGreyColor)),
                    8.width,
                    TextFormField(
                      autofocus: widget.sendingType == 'Forward' ? true : false,
                      minLines: 1,
                      maxLines: 10,
                      controller: toCont,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: GMGreyColor),
                        filled: true,
                        fillColor: GMWhiteColor,
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                      ),
                    ).expand(),
                  ],
                ).expand(),
                !isExpanded
                    ? IconButton(
                        icon: Icon(Icons.keyboard_arrow_down, color: GMGreyColor),
                        onPressed: () {
                          isExpanded = true;
                          setState(() {});
                        },
                      )
                    : 0.height,
              ],
            ),
            Divider(color: GMAppDividerColor).visible(isExpanded),
            isExpanded
                ? Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Cc', style: primaryTextStyle(color: GMGreyColor)),
                            8.width,
                            TextFormField(
                              controller: ccCont,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: GMGreyColor),
                                filled: true,
                                fillColor: GMWhiteColor,
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                              ),
                            ).expand(),
                          ],
                        ),
                        Divider(color: GMAppDividerColor),
                        Row(
                          children: [
                            Text('Bcc', style: primaryTextStyle(color: GMGreyColor)),
                            8.width,
                            TextFormField(
                              controller: bCCCont,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: GMGreyColor),
                                filled: true,
                                fillColor: GMWhiteColor,
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                              ),
                            ).expand(),
                          ],
                        )
                      ],
                    ),
                  )
                : 0.height,
            Divider(color: GMAppDividerColor),
            TextFormField(
              cursorColor: Colors.black,
              controller: subjectCont,
              decoration: InputDecoration(
                hintText: 'Subject',
                contentPadding: EdgeInsets.all(0),
                hintStyle: TextStyle(color: GMGreyColor),
                labelStyle: TextStyle(color: GMBlackColor),
                filled: true,
                fillColor: GMWhiteColor,
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
              ),
            ),
            Divider(color: GMAppDividerColor),
            TextFormField(
              onTap: () {
                if (ccCont.text.isEmpty) {
                  isExpanded = false;
                } else if (bCCCont.text.isEmpty) {
                  isExpanded = false;
                }
                setState(() {});
              },
              minLines: 5,
              maxLines: 100,
              keyboardType: TextInputType.multiline,
              cursorColor: Colors.black,
              controller: composeMailCont,
              autofocus: widget.sendingType != 'Forward' ? true : false,
              decoration: InputDecoration(
                hintText: 'Compose email',
                contentPadding: EdgeInsets.only(top: 16, bottom: 16),
                hintStyle: TextStyle(color: GMGreyColor),
                labelStyle: TextStyle(color: GMBlackColor),
                filled: true,
                fillColor: GMWhiteColor,
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GMWhiteColor)),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showPopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
      items: [
        PopupMenuItem<String>(child: const Text('Attach file', style: TextStyle(color: GMBlackColor)), value: '1'),
        PopupMenuItem<String>(child: const Text('Insert from Drive', style: TextStyle(color: GMBlackColor)), value: '2'),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
      } else if (itemSelected == "2") {
      } else {}
    });
  }
}
