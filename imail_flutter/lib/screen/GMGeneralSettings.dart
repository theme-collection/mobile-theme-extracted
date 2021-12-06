import 'package:flutter/material.dart';
import 'package:imail_flutter/components/CustomDialogComponent.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:nb_utils/nb_utils.dart';

class GMGeneralSettings extends StatefulWidget {
  @override
  _GMGeneralSettingsState createState() => _GMGeneralSettingsState();
}

class _GMGeneralSettingsState extends State<GMGeneralSettings> {
  bool? conversionCheckedValue = false;
  bool? autoFitCheckedValue = false;
  bool? linkCheckedValue = false;
  bool? deleteCheckedValue = false;
  bool? archivingCheckedValue = false;
  bool? sendingCheckedValue = false;

  void _displayDialog(BuildContext context, {String? title, String? radioText1, String? radioText2, String? radioText3}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(title: 'Default notification action', radioText1: 'Archive', radioText2: 'Delete');
        });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: GMWhiteColor,
        title: Text('General Settings', style: boldTextStyle(color: GMBlackColor, size: 18)),
        actions: [
          PopupMenuButton(
            onSelected: (dynamic v) {
              if (v == 1) {
                dialog(context, title: 'Clear Search history?', subtitle: "All of the searches that you've previously performed will be removed.");
              } else if (v == 2) {
                dialog(
                  context,
                  title: 'Clear Picture approvals?',
                  subtitle: "Stop displaying in-line image from sender that you have previously allowed.",
                );
              }
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(PopupMenuItem(child: Text('Manage Accounts', style: primaryTextStyle()), value: 0));
              list.add(PopupMenuItem(child: Text('Clear search history', style: primaryTextStyle()), value: 1));
              list.add(PopupMenuItem(child: Text('Clear picture approvals', style: primaryTextStyle()), value: 2));
              list.add(PopupMenuItem(child: Text('Help and feedback', style: primaryTextStyle()), value: 3));
              return list;
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        children: [
          widgetGeneralSettings(title: 'Default notification action', subTitle: 'Archive').onTap(() {
            _displayDialog(context, title: 'Default notification action', radioText1: 'Archive', radioText2: 'Delete');
          }),
          Divider(color: GMAppDividerColor),
          CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("Conversation View"),
              subtitle: Text(
                'Group emails in the same conversation for IMAP, POP3 and exchange account',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              value: conversionCheckedValue,
              onChanged: (bool? newValue) {
                setState(() {
                  conversionCheckedValue = newValue;
                });
              }),
          Divider(color: GMAppDividerColor),
          widgetGeneralSettings(title: 'Conversation list density', subTitle: 'Default'),
          Divider(color: GMAppDividerColor),
          widgetGeneralSettings(title: 'Swipe action', subTitle: 'Configure swipe action to quickly act on emails in the conversation list'),
          Divider(color: GMAppDividerColor),
          widgetGeneralSettings(title: 'Default reply action', subTitle: 'Choose your default reply action').onTap(() {
            _displayDialog(context, title: 'Default reply action', radioText1: 'Reply', radioText2: 'Reply to all');
          }),
          Divider(color: GMAppDividerColor),
          CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("Auto-fit messages", style: primaryTextStyle(size: 18)),
              subtitle: Text('Shrink messages to fit the screen'),
              value: autoFitCheckedValue,
              onChanged: (bool? newValue) {
                setState(() {
                  autoFitCheckedValue = newValue;
                });
              }),
          Divider(color: GMAppDividerColor),
          widgetGeneralSettings(title: 'Auto-advance', subTitle: 'Show conversation list after you archive or delete').onTap(() {
            _displayDialog(context, title: 'Advance to', radioText1: 'Newer', radioText2: 'Older', radioText3: 'Conversation list');
          }),
          Divider(color: GMAppDividerColor),
          CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("open web links in gmail", style: primaryTextStyle(size: 18)),
              subtitle: Text('Turn on for faster browsing'),
              value: linkCheckedValue,
              onChanged: (bool? newValue) {
                setState(() {
                  linkCheckedValue = newValue;
                });
              }),
          8.height,
          Text('Action Conformations', style: boldTextStyle(color: GMBlueColor, size: 14)),
          CheckboxListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("Confirm before deleting", style: primaryTextStyle(size: 18)),
            value: deleteCheckedValue,
            onChanged: (bool? newValue) {
              setState(() {
                deleteCheckedValue = newValue;
              });
            },
          ),
          Divider(color: GMAppDividerColor),
          CheckboxListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("Confirm before archiving", style: primaryTextStyle(size: 18)),
            value: archivingCheckedValue,
            onChanged: (bool? newValue) {
              setState(() {
                archivingCheckedValue = newValue;
              });
            },
          ),
          Divider(color: GMAppDividerColor),
          CheckboxListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("Confirm before sending", style: primaryTextStyle(size: 18)),
            value: sendingCheckedValue,
            onChanged: (bool? newValue) {
              setState(() {
                sendingCheckedValue = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}

void dialog(BuildContext context, {String? title, String? subtitle}) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        elevation: 5,
        contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        title: Row(
          children: [
            Icon(Icons.warning, size: 24),
            8.width,
            Text(title!, style: boldTextStyle(size: 18)),
          ],
        ),
        content: Text(subtitle!, style: secondaryTextStyle(size: 16)),
        actions: [
          FlatButton(
            onPressed: () {
              finish(context);
            },
            child: Text('Cancel', style: primaryTextStyle(color: GMBlueColor)),
          ),
          FlatButton(
            onPressed: () {
              finish(context);
            },
            child: Text('Clear', style: primaryTextStyle(color: GMBlueColor)),
          )
        ],
      );
    },
  );
}

Widget widgetGeneralSettings({required String title, required String subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: primaryTextStyle(size: 18)),
      Text(subTitle, style: secondaryTextStyle(size: 16)),
    ],
  );
}
