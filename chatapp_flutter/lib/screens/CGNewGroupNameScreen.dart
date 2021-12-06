import 'package:chatapp_flutter/model/CGUserModel.dart';
import 'package:chatapp_flutter/utils/CGColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGNewGroupNameScreen extends StatefulWidget {
  final List<User>? participant;

  CGNewGroupNameScreen({this.participant});

  @override
  _CGNewGroupNameScreenState createState() => _CGNewGroupNameScreenState();
}

class _CGNewGroupNameScreenState extends State<CGNewGroupNameScreen> {
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
            children: [Text("New group", style: TextStyle(fontWeight: FontWeight.bold)), Text("Add subject", style: TextStyle(fontSize: 14))],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey[300],
                              child: Icon(Icons.camera_alt_rounded, color: Colors.white),
                            ).cornerRadiusWithClipRRect(60),
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(keyboardType: TextInputType.text, decoration: InputDecoration(hintText: "Type group subject here...")),
                            ),
                            Container(padding: EdgeInsets.only(top: 16, left: 8), child: Icon(Icons.insert_emoticon_rounded))
                          ],
                        ),
                        32.height,
                        Text("Provide a group subject and optional group icon")
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: MediaQuery.of(context).size.height - 250,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Participant : ${widget.participant!.length}", style: boldTextStyle(size: 16)),
                        GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1, crossAxisSpacing: 0, mainAxisSpacing: 0, crossAxisCount: 4),
                            itemCount: widget.participant!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 30,
                                height: 30,
                                child: Column(
                                  children: [CircleAvatar(backgroundImage: NetworkImage(widget.participant![index].avatarUrl!), radius: 24), Text(widget.participant![index].name!)],
                                ),
                              );
                            })
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 140,
                right: 30,
                child: InkWell(
                  onTap: () {
                    finish(context);
                    toast("Group created", gravity: ToastGravity.CENTER);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ).cornerRadiusWithClipRRect(60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
