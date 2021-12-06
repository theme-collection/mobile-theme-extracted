import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomDialog extends StatefulWidget {
  final String? title, radioText1, radioText2;

  CustomDialog({this.title, this.radioText1, this.radioText2});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String? radioValue = 'Archive';
  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    init();
    selectedRadio = 0;
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title!, style: primaryTextStyle(size: 20)),
      contentPadding: EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
              title: Text(widget.radioText1!, style: primaryTextStyle()),
              value: 'Archive',
              groupValue: radioValue,
              onChanged: (dynamic value) {
                radioValue = value;
                setState(() {});
              }),
          RadioListTile(
              title: Text(widget.radioText2!, style: primaryTextStyle()),
              value: 'Delete',
              groupValue: radioValue,
              onChanged: (dynamic value) {
                radioValue = value;
                setState(() {});
              }),
        ],
      ),
      actions: [
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            finish(context);
          },
        )
      ],
    );
  }
}
