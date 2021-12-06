import 'package:chatapp_flutter/model/CGChatModel.dart';
import 'package:chatapp_flutter/model/CGUserModel.dart';
import 'package:chatapp_flutter/screens/CGNewGroupNameScreen.dart';
import 'package:chatapp_flutter/utils/CGColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGNewGroupAndBroadcastScreen extends StatefulWidget {
  List<User> newGroup = [];
  List<User> newGroup2 = [];
  bool _isParticipantAdded = false;
  bool? isNewGroup;

  CGNewGroupAndBroadcastScreen({this.isNewGroup});

  @override
  _CGNewGroupAndBroadcastScreenState createState() => _CGNewGroupAndBroadcastScreenState();
}

class _CGNewGroupAndBroadcastScreenState extends State<CGNewGroupAndBroadcastScreen> {
  @override
  void initState() {
    super.initState();
    for (var i in fav) {
      i.isAddToGroup = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  finish(context);
                }),
            backgroundColor: secondaryColor,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(widget.isNewGroup! ? "New group" : "New broadcast", style: TextStyle(fontWeight: FontWeight.bold)), Text("${widget.newGroup2.length} participants", style: TextStyle(fontSize: 14))],
            ),
            actions: [IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {})],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (widget._isParticipantAdded)
                  Column(
                    children: [
                      Container(
                        height: 90,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.newGroup2.length,
                            itemBuilder: (context, index) {
                              User data = widget.newGroup2[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {});
                                  data.isAddToGroup = !data.isAddToGroup!;
                                  widget.newGroup2.removeAt(index);
                                  widget.newGroup.clear();
                                  if (widget.newGroup2.isEmpty) widget._isParticipantAdded = false;
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 14, top: 8),
                                  child: Stack(children: [
                                    CircleAvatar(backgroundImage: NetworkImage(widget.newGroup2[index].avatarUrl!), radius: 35),
                                    Positioned(
                                      bottom: 6,
                                      right: 0,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        child: Icon(Icons.clear, color: Colors.white, size: 14),
                                        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(30.0)),
                                      ),
                                    )
                                  ]),
                                ),
                              );
                            }),
                      ),
                      Divider(thickness: 1)
                    ],
                  ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: fav.length,
                      itemBuilder: (context, index) {
                        User data = fav[index];
                        return InkWell(
                          onTap: () {
                            data.isAddToGroup = !data.isAddToGroup!;
                            data.isAddToGroup! ? widget.newGroup.add(data) : widget.newGroup.remove(data);
                            widget.newGroup2 = widget.newGroup.toSet().toList();
                            widget.newGroup.isNotEmpty ? widget._isParticipantAdded = true : widget._isParticipantAdded = false;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Stack(children: [
                                      CircleAvatar(backgroundImage: NetworkImage(fav[index].avatarUrl!), radius: 28, backgroundColor: secondaryColor),

                                      /* ***green dot for added to group*** */
                                      if (fav[index].isAddToGroup!)
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            child: Icon(Icons.check, color: Colors.white, size: 14),
                                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(30.0)),
                                          ),
                                        )
                                    ]),
                                    18.width,
                                    Text(fav[index].name!, style: boldTextStyle(size: 18)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          floatingActionButton: widget.isNewGroup!
              ? FloatingActionButton(
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    finish(context);
                    CGNewGroupNameScreen(participant: widget.newGroup2).launch(context);
                  },
                )
              : FloatingActionButton(
                  child: Icon(Icons.check, color: Colors.white),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    finish(context);
                    toast("New broadcast created", gravity: ToastGravity.CENTER);
                  },
                )),
    );
  }
}
