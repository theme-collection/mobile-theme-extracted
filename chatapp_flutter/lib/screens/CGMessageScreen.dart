import 'package:chatapp_flutter/main.dart';
import 'package:chatapp_flutter/model/CGChatModel.dart';
import 'package:chatapp_flutter/model/CGUserModel.dart';
import 'package:chatapp_flutter/screens/CGPayment/CGPaymentScreen.dart';
import 'package:chatapp_flutter/screens/CGProfilescreen.dart';
import 'package:chatapp_flutter/utils/CGColors.dart';
import 'package:chatapp_flutter/utils/CGDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

class CGMessageScreen extends StatefulWidget {
  final User? user;
  bool _isSend = false;
  bool _isEmojiShow = false;
  FocusNode? _focusNode;
  int? radioGroupItem = 1;
  bool? chk = false;

  final _messageController = TextEditingController();

  CGMessageScreen({this.user});

  @override
  _CGMessageScreenState createState() => _CGMessageScreenState();
}

class _CGMessageScreenState extends State<CGMessageScreen> with SingleTickerProviderStateMixin {
  final popupmenuButton = GlobalKey<State>();
  bool iselected = false;

  @override
  void initState() {
    super.initState();
    widget._focusNode = FocusNode();
  }

  _buildMessage(ChatModel message, bool isMe) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 2, offset: Offset(2, 2), color: Colors.black.withOpacity(.20))],
        borderRadius: BorderRadius.circular(5.0),
        color: isMe ? Color(0xffdcf8c6) : Color(0xffffffff),
      ),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: isMe ? EdgeInsets.only(top: 6.0, bottom: 4.0, left: 100.0, right: 6.0) : EdgeInsets.only(top: 6.0, bottom: 4.0, right: 120.0, left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Text(message.text),
          Text(message.text!),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(message.time!, style: primaryTextStyle(size: 12)),
              2.width,
              isMe ? Icon(Icons.done_all, size: 15.0, color: Colors.blueAccent) : Text(''),
            ],
          ),
        ],
      ),
    );
  }

  _buildSendMessageWidget() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(4, 16, 4, 8),
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: widget._isEmojiShow ? Icon(Icons.keyboard) : Icon(Icons.insert_emoticon),
                iconSize: 25.0,
                color: Colors.grey,
                onPressed: () {
                  setState(() {});
                  if (!widget._isEmojiShow) {
                    widget._focusNode!.unfocus();
                    widget._isEmojiShow = true;
                  } else {
                    widget._focusNode!.requestFocus();
                    widget._isEmojiShow = false;
                  }
                },
              ),
              TextField(
                controller: widget._messageController,
                focusNode: widget._focusNode,
                onSubmitted: (data) {
                  setState(() {});
                  widget._isSend = false;
                },
                onChanged: (data) {
                  setState(() {});
                  widget._messageController.text.isNotEmpty ? widget._isSend = true : widget._isSend = false;
                },
                onTap: () {
                  setState(() {});
                  if (widget._isEmojiShow) widget._isEmojiShow = false;
                },
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration.collapsed(hintText: 'Type a message'),
              ).expand(),
              IconButton(
                icon: Icon(Icons.attach_file),
                iconSize: 25.0,
                color: Colors.grey,
                onPressed: () {
                  setState(() {});
                  //_showAttachmentDialog();
                  if (!widget._isEmojiShow) _showAttachmentDialog();
                },
              ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                iconSize: 25.0,
                color: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
        ).expand(),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60.0), color: secondaryColor),
          child: IconButton(
            icon: widget._isSend ? Icon(Icons.send) : Icon(Icons.mic),
            iconSize: 20.0,
            color: Colors.white,
            onPressed: () {
              setState(() {});
              widget._isSend && widget._messageController.text.isNotEmpty ? _sendMessage() : print("no message");
            },
          ),
        ).paddingRight(10).paddingTop(10),
      ],
    );
  }

  /* ****for send message by current user**** */
  _sendMessage() {
    message.insert(0, ChatModel(sender: currentUser, text: widget._messageController.text, time: "11:45"));
    Future.delayed(Duration(milliseconds: 500), () {
      message.insert(0, ChatModel(sender: james, text: widget._messageController.text, time: "10:45"));
      widget._messageController.clear();
      setState(() {});
    });
  }

  _showAttachmentDialog() {
    return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(top: 50),
            height: 350,
            margin: EdgeInsets.only(bottom: 70, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: GridView.count(
              childAspectRatio: 1.5,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: [
                _attachmentDataItem(context, Icon(Entypo.text_document, size: 30, color: Colors.white), "Document", Colors.indigo[800], 1),
                _attachmentDataItem(context, Icon(Icons.camera_alt_rounded, size: 30, color: Colors.white), "Camera", Colors.pink[800], 2),
                _attachmentDataItem(context, Icon(Icons.panorama, size: 30, color: Colors.white), "Gallery", Colors.purple, 3),
                _attachmentDataItem(context, Icon(MaterialIcons.headset, size: 30, color: Colors.white), "Audio", Colors.orange, 4),
                _attachmentDataItem(context, Icon(Icons.attach_money, size: 30, color: Colors.white), "Payment", Colors.teal, 5),
                _attachmentDataItem(context, Icon(Icons.videocam, size: 30, color: Colors.white), "Room", Colors.indigo, 6),
                _attachmentDataItem(context, Icon(Icons.location_on, size: 30, color: Colors.white), "Location", Colors.green[700], 7),
                _attachmentDataItem(context, Icon(Icons.person, size: 30, color: Colors.white), "Contact", Colors.blue[700], 8)
              ],
            ),
          ),
        );
      },
    );
  }

  _attachmentDataItem(BuildContext context, Icon icons, String name, colors, int index) {
    return Column(children: [
      GestureDetector(
          onTap: () {
            if (index == 5) {
              finish(context);
              CGPaymentScreen().launch(context);
            } else {
              finish(context);
            }
          },
          child: CircleAvatar(child: icons, backgroundColor: colors, radius: 30)),
      8.height,
      Material(child: Text(name, style: TextStyle(fontSize: 14)))
    ]);
  }

  _openwallpaperImageDialog() {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8, mainAxisSpacing: 4, crossAxisSpacing: 8, crossAxisCount: 4),
          itemCount: wallpaperImage.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {});
                setWallpaper = index;
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(fit: BoxFit.cover, image: ExactAssetImage(wallpaperImage[index])),
                ),
              ),
            );
          },
        ).paddingAll(16);
      },
    );
  }

  /*_emojiPicker() {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      buttonMode: ButtonMode.MATERIAL,
      recommendKeywords: ["racing", "horse"],
      numRecommended: 10,
      onEmojiSelected: (emoji, category) {
        widget._messageController.text += emoji.emoji;
      },
    );
  }*/

  _showMuteNotification() {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              title: Text("Mute notification for..."),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: secondaryColor,
                          value: 1,
                          groupValue: widget.radioGroupItem,
                          onChanged: (dynamic itemval) {
                            widget.radioGroupItem = itemval;
                            state(() {});
                          },
                        ),
                        Text("8 hours")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: secondaryColor,
                          value: 2,
                          groupValue: widget.radioGroupItem,
                          onChanged: (dynamic itemval) {
                            widget.radioGroupItem = itemval;
                            state(() {});
                          },
                        ),
                        Text("1 week")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: secondaryColor,
                          value: 3,
                          groupValue: widget.radioGroupItem,
                          onChanged: (dynamic itemval) {
                            widget.radioGroupItem = itemval;
                            state(() {});
                          },
                        ),
                        Text("Always")
                      ],
                    ),
                    Divider(thickness: 1),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: secondaryColor,
                          value: widget.chk,
                          onChanged: (ischeck) {
                            widget.chk = ischeck;
                            state(() {});
                          },
                        ),
                        Text("Show notification")
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    finish(context);
                  },
                  child: Text("CANCEL", style: TextStyle(color: secondaryColor)),
                ),
                FlatButton(
                  onPressed: () {
                    finish(context);
                  },
                  child: Text("OK", style: TextStyle(color: secondaryColor)),
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffece5dd),
        appBar: AppBar(
          backgroundColor: secondaryColor,
          titleSpacing: 0,
          title: InkWell(
            onTap: () {
              CGProfileScreen(image: widget.user).launch(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  foregroundColor: Theme.of(context).accentColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(widget.user!.avatarUrl!),
                ),
                SizedBox(width: 8.0),
                Text(widget.user!.name.validate(), style: boldTextStyle(color: Colors.white)),
              ],
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              finish(context);
            },
          ),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam, color: Colors.white)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call, color: Colors.white)),
            PopupMenuButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onSelected: (dynamic val) {
                if (val == 4) {
                  _openwallpaperImageDialog();
                } else if (val == 1) {
                  CGProfileScreen(image: widget.user).launch(context);
                } else if (val == 3) {
                  _showMuteNotification();
                }
              },
              itemBuilder: (context) => menuEntry,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
              fit: BoxFit.cover,
              image: Image.asset(wallpaperImage[setWallpaper]).image,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: ListView.builder(
                  reverse: true,
                  itemCount: message.length,
                  itemBuilder: (context, i) {
                    bool isMe = message[i].sender!.id == currentUser.id;

                    return _buildMessage(message[i], isMe);
                  },
                ),
              ).expand(),
              _buildSendMessageWidget(),
              //   if (widget._isEmojiShow) _emojiPicker(),
            ],
          ),
        ),
      ),
    );
  }
}
