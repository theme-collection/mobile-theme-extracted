import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class SNStoriesModel {
  String? name;
  String? time;
  String? img;
  bool? seen;

  SNStoriesModel({this.name, this.time, this.img, this.seen});
}

class SNUserModel {
  String? name;
  String? img;
  String? comment;

  SNUserModel({this.name, this.img, this.comment});
}

class SNPostModel {
  String? name;
  String? subTitle;
  String? detail;
  String? img;
  String? userImg;
  String location;
  int? totalLike;
  int? totalComment;
  List<SNUserModel>? comment;
  bool isSaved;
  bool isLike;

  SNPostModel({this.name, this.subTitle, this.detail, this.location = '', this.totalLike, this.img, this.userImg, this.comment, this.totalComment, this.isSaved = false, this.isLike = false});
}

class SNActivityModel {
  String? name;
  String? comment;
  String? time;
  String? commentImg;
  String? userImg;

  SNActivityModel({this.name, this.comment, this.time, this.commentImg, this.userImg});
}

class SNChatModel {
  String? name;
  String? nickName;
  String? img;
  String? lastMsg;
  String? time;
  int? unreadCount;
  bool isActive;

  SNChatModel({this.name, this.nickName, this.img, this.lastMsg, this.time, this.unreadCount, this.isActive = false});
}

class SNMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  SNMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}

class SNSavedModel {
  String? img;
  String? totalLikeCount;
  int? totalCommentCount;
  bool isMouse;

  SNSavedModel({this.img, this.totalLikeCount, this.totalCommentCount, this.isMouse = false});
}

class SNEditProfileModel {
  String? title;
  bool isSelected;

  SNEditProfileModel({this.title, this.isSelected = false});
}

class SNEmailSMSModel {
  String? title;
  String? subTitle;
  bool isSelected;

  SNEmailSMSModel({this.title, this.subTitle, this.isSelected = true});
}

class SNAccountModel {
  String? profileImg;
  String? name;
  bool selected;

  SNAccountModel({this.profileImg, this.name, this.selected = false});
}

class SNProfileSideDrawerModel {
  String? name;
  IconData? icon;

  SNProfileSideDrawerModel({this.name, this.icon});
}

class SNSettingModel {
  String? name;
  String subTitle;
  String? icon;
  Widget? screenWidget;

  SNSettingModel({this.name, this.subTitle = '', this.icon, this.screenWidget});
}

class SNCommentModel {
  String? name;
  String? userImg;
  String? time;
  String? comment;
  ObservableList<SNCommentModel>? subComment;
  bool isLike;
  int? likes;

  SNCommentModel({this.name, this.userImg, this.time, this.comment, this.subComment, this.isLike = false, this.likes});
}

class SNSearchModel {
  String? name;
  String? subTitle;
  String? userImg;
  int? posts;
  int? follower;
  int? following;
  bool isFollow;
  bool isVerifyAccount;

  SNSearchModel({this.name, this.subTitle, this.userImg, this.posts, this.follower, this.following, this.isFollow = false, this.isVerifyAccount = false});
}
