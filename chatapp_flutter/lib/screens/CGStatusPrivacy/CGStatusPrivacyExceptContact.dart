import 'package:chatapp_flutter/model/CGChatModel.dart';
import 'package:chatapp_flutter/utils/CGColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGStatusPrivacyExceptContact extends StatefulWidget {
  bool _selectAll = false;
  int numContact = 0;

  @override
  _CGStatusPrivacyExceptContactState createState() => _CGStatusPrivacyExceptContactState();
}

class _CGStatusPrivacyExceptContactState extends State<CGStatusPrivacyExceptContact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: secondaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Hide status from...", style: TextStyle(fontWeight: FontWeight.bold)), Text("${widget.numContact} contact excluded", style: boldTextStyle(size: 14))],
          ),
          actions: [
            IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: () {}),
            IconButton(
                icon: Icon(Icons.playlist_add_check),
                color: Colors.white,
                onPressed: () {
                  setState(() {});
                  widget._selectAll = !widget._selectAll;
                  fav.forEach((element) {
                    element.isHide = widget._selectAll;
                  });
                  widget._selectAll ? widget.numContact = fav.length : widget.numContact = 0;
                })
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {});
                      fav[index].isHide = !fav[index].isHide!;
                      widget._selectAll = false;
                      fav[index].isHide! ? widget.numContact++ : widget.numContact--;
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [Image.network(fav[index].avatarUrl!, width: 42, height: 42).cornerRadiusWithClipRRect(60), 12.width, Text(fav[index].name!, style: TextStyle(fontSize: 16))],
                          ),
                          fav[index].isHide! ? _showcheckBox() : _hideCheckBox()
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (_, i) => Divider(thickness: 1),
              itemCount: fav.length),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            finish(context);
            toast("setting updated", gravity: ToastGravity.CENTER);
          },
          child: Icon(Icons.check, color: Colors.white),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  _hideCheckBox() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey[400]!)),
    );
  }

  _showcheckBox() {
    return Container(width: 25, height: 25, decoration: BoxDecoration(color: Colors.red[500], borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey[400]!)), child: Icon(Icons.check, size: 16, color: Colors.white));
  }
}
