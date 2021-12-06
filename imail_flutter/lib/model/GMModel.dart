import 'package:flutter/material.dart';

class GMMailModel {
  String? name;
  String? title;
  String? description;
  String? dateTime;
  String? date;
  String? composeMsg;
  String? toSend;
  bool ratting = false;

  GMMailModel({
    this.name,
    this.title,
    this.description,
    this.composeMsg,
    this.date,
    this.dateTime,
    this.toSend,
  });
}

class DrawerModel {
  Widget? leading;
  String? title;
  Widget? trailing;
  Widget? screenName;
  List<GMMailModel?>? list;

  DrawerModel({this.leading, this.title, this.trailing, this.list, this.screenName});
}

class GMAccountModel {
  String? firstLetter;
  String? name;
  String? mail;
  String? totalMail;

  GMAccountModel({this.firstLetter, this.name, this.mail, this.totalMail});
}

class GMSnoozeModel {
  IconData? image;
  String? day;
  String? time;

  GMSnoozeModel({this.image, this.day, this.time});
}
