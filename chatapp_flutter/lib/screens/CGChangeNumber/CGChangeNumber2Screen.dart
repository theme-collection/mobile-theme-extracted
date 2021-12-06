import 'package:chatapp_flutter/utils/CGConstant.dart';
import 'package:chatapp_flutter/utils/CGWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGChangeNumber2 extends StatefulWidget {
  @override
  _CGChangeNumber2State createState() => _CGChangeNumber2State();
}

class _CGChangeNumber2State extends State<CGChangeNumber2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Change number") as PreferredSizeWidget?,
        body: Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.only(top: CGAppPadding, left: CGAppPadding, right: CGAppPadding, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(children: [
                  Text("Enter your old phone number with country code.",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          child: TextField(readOnly: true, decoration: InputDecoration(hintText: "+91")),
                        ),
                        10.width,
                        Flexible(
                          child: TextField(decoration: InputDecoration(hintText: "old phone number")),
                        ),
                      ],
                    ),
                  ),
                  Text("Enter your new phone number with country code.",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          child: TextField(readOnly: true, decoration: InputDecoration(hintText: "+91")),
                        ),
                        10.width,
                        Flexible(
                          child: TextField(decoration: InputDecoration(hintText: "New phone number")),
                        ),
                      ],
                    ),
                  ),
                ]),
                RaisedButton(
                  onPressed: () {
                    finish(context);
                    toast("Change Number Successfully");
                  },
                  child: Text("NEXT", style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
