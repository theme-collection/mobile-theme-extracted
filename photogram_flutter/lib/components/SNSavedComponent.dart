import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photogram_flutter/components/SMSavedItemWidget.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';

class SNSavedComponent extends StatefulWidget {
  static String tag = '/SNSavedComponent';

  @override
  SNSavedComponentState createState() => SNSavedComponentState();
}

class SNSavedComponentState extends State<SNSavedComponent> {
  List<SNSavedModel> list = getSavedList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.end,
        runAlignment: WrapAlignment.center,
        children: list.map((data) {
          return SNSaveItemWidget(data);
        }).toList(),
      ),
    );
  }
}
