import 'package:chatapp_flutter/utils/CGConstant.dart';
import 'package:chatapp_flutter/utils/CGWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGPaymentHelpScreen extends StatefulWidget {
  @override
  _CGPaymentHelpScreenState createState() => _CGPaymentHelpScreenState();
}

class _CGPaymentHelpScreenState extends State<CGPaymentHelpScreen> {
  TextEditingController _textEditingController = new TextEditingController();
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Contact us") as PreferredSizeWidget?,
        body: Container(
          padding: EdgeInsets.all(CGAppPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                color: Colors.grey[300],
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (data) {
                    _textEditingController.text.isEmpty ? enable = false : enable = true;
                    setState(() {});
                  },
                  maxLines: 4,
                  decoration: InputDecoration(hintText: "Describe your problem"),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Have you read our FAQ yet?", style: TextStyle(color: Colors.blue, fontSize: 18)),
                RaisedButton(
                    onPressed: enable
                        ? () {
                            finish(context);
                          }
                        : null,
                    child: Text(
                      "DONE",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green)
              ])
            ],
          ),
        ),
      ),
    );
  }
}
