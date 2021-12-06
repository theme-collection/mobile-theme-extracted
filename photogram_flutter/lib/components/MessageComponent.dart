import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNWidgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class MessageComponent extends StatefulWidget {
  static String tag = '/MessageComponent';

  final String? personName;

  @override
  MessageComponentState createState() => MessageComponentState();

  MessageComponent({this.personName});
}

class MessageComponentState extends State<MessageComponent> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListing = getChatMsgData();
  var personName = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      var msgModel = SNMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.senderId = sender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = SNMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = receiver_id;

      msgController.text = '';

      if (mounted) scrollController.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget msgList() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(color: appStore.appBarColor),
        child: ListView.separated(
          separatorBuilder: (_, i) => Divider(color: Colors.transparent),
          shrinkWrap: true,
          reverse: true,
          controller: scrollController,
          itemCount: msgListing.length,
          padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
          itemBuilder: (_, index) {
            SNMessageModel data = msgListing[index];
            var isMe = data.senderId == sender_id;

            return ChatMessageWidget(isMe: isMe, data: data);
          },
        ),
      );
    }

    Widget textField() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          decoration: BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: msgController,
                focusNode: msgFocusNode,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration.collapsed(hintText: personName.isNotEmpty ? 'Write to ${widget.personName}' : 'Type a message', hintStyle: primaryTextStyle()),
                style: primaryTextStyle(),
                onSubmitted: (s) {
                  sendClick();
                },
              ).expand(),
              IconButton(
                icon: Icon(Icons.send, size: 25, color: appStore.iconColor),
                onPressed: () async {
                  sendClick();
                },
              ),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [msgList(), textField()],
    );
  }
}
