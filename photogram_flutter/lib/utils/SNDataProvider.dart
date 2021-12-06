import 'dart:math';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mobx/mobx.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/screens/SNAccountScreen.dart';
import 'package:photogram_flutter/screens/SNAdsScreen.dart';
import 'package:photogram_flutter/screens/SNChangePasswordScreen.dart';
import 'package:photogram_flutter/screens/SNHelpScreen.dart';
import 'package:photogram_flutter/screens/SNInviteFollowFriendScreen.dart';
import 'package:photogram_flutter/screens/SNNotificationScreen.dart';
import 'package:photogram_flutter/screens/SNPrivacyScreen.dart';
import 'package:photogram_flutter/screens/SNSecurityScreen.dart';
import 'package:photogram_flutter/screens/SNSetThemeScreen.dart';
import 'package:photogram_flutter/utils/SNImages.dart';

import 'SNConstants.dart';
import 'SNImages.dart';

const sender_id = 1;
const receiver_id = 2;

List<SNStoriesModel> getStories() {
  List<SNStoriesModel> list = [];

  SNStoriesModel s1 = SNStoriesModel();
  s1.name = 'Smith';
  s1.img = SNUser6;
  s1.seen = false;
  list.add(s1);

  SNStoriesModel s2 = SNStoriesModel();
  s2.name = 'Nilkamal';
  s2.img = SNUser7;
  s2.seen = false;
  list.add(s2);

  SNStoriesModel s3 = SNStoriesModel();
  s3.name = 'Cheril';
  s3.img = SNUser6;
  s3.seen = false;
  list.add(s3);

  SNStoriesModel s4 = SNStoriesModel();
  s4.name = 'Tom';
  s4.img = SNUser7;
  s4.seen = true;
  list.add(s4);

  SNStoriesModel s5 = SNStoriesModel();
  s5.img = SNProfile1;
  s5.name = 'Jerry';
  s5.seen = true;
  list.add(s5);

  SNStoriesModel s6 = SNStoriesModel();
  s6.img = SNUser7;
  s6.name = 'Nora';
  s6.seen = false;
  list.add(s6);

  SNStoriesModel s7 = SNStoriesModel();
  s7.name = 'Lia Smith';
  s7.img = SNUser1;
  s7.seen = false;
  list.add(s7);

  SNStoriesModel s8 = SNStoriesModel();
  s8.name = 'Kali';
  s8.img = SNUser2;
  s8.seen = false;
  list.add(s8);

  SNStoriesModel s9 = SNStoriesModel();
  s9.name = 'Nik Jon';
  s9.img = SNUser4;
  s9.seen = false;
  list.add(s9);

  SNStoriesModel s10 = SNStoriesModel();
  s10.name = 'Akki';
  s10.img = SNUser5;
  s10.seen = true;
  list.add(s10);

  SNStoriesModel s11 = SNStoriesModel();
  s11.img = SNUser6;
  s11.name = 'Aysh';
  s11.seen = true;
  list.add(s11);

  SNStoriesModel s12 = SNStoriesModel();
  s12.img = SNUser7;
  s12.name = 'KitKAt_23';
  s12.seen = false;
  list.add(s12);

  return list;
}

List<SNPostModel> getPostList() {
  List<SNPostModel> list = [];
  SNPostModel p1 = SNPostModel();
  p1.name = 'Nora Joe';
  p1.subTitle = 'Shopping Time';
  p1.location = 'New York\'s Fifth Avenue';
  p1.isSaved = false;
  p1.img = SNPost1;
  p1.userImg = SNUser1;
  p1.totalLike = Random.secure().nextInt(1000);
  p1.totalComment = Random.secure().nextInt(100);
  p1.detail = LoremText;
  p1.isLike = true;
  p1.comment = [
    SNUserModel(name: 'John Smith', img: SNUser2, comment: 'Like your photo'),
    SNUserModel(name: 'Mariya', img: SNUser1, comment: 'comment on your photo Nice Photo comment on your photo Nice Photo'),
    SNUserModel(name: 'Nora', img: SNUser3, comment: 'Like your photo'),
  ];
  list.add(p1);

  SNPostModel p2 = SNPostModel();
  p2.name = 'Nik John';
  p2.subTitle = 'Shopping Time';
  p2.isSaved = false;
  p2.location = 'महाराष्ट्र, गुजरात';
  p2.img = SNPost2;
  p2.userImg = SNUser2;
  p2.totalLike = Random.secure().nextInt(1000);
  p2.totalComment = Random.secure().nextInt(100);
  p2.detail = LoremText;
  p2.comment = [
    SNUserModel(name: 'John Smith', img: SNUser2, comment: 'Like your photo'),
    SNUserModel(name: 'Mariya', img: SNUser1, comment: 'Nice Photo'),
    SNUserModel(name: 'jamis', img: SNUser1, comment: 'Like your photo'),
    SNUserModel(name: 'Nora', img: SNUser3, comment: 'Like your photo'),
  ];
  list.add(p2);

  SNPostModel p3 = SNPostModel();
  p3.name = 'KitKat_068';
  p3.subTitle = 'Shopping Time';
  p3.isSaved = false;
  p3.img = SNPost3;
  p3.userImg = SNUser3;
  p3.totalLike = Random.secure().nextInt(1000);
  p3.totalComment = Random.secure().nextInt(100);
  p3.detail = LoremText;
  p3.isLike = true;
  p3.comment = [
    SNUserModel(name: 'John Smith', img: SNUser2, comment: 'Like your photo'),
    SNUserModel(name: 'Mariya', img: SNUser3, comment: 'Nice Photo'),
  ];
  list.add(p3);

  SNPostModel p4 = SNPostModel();
  p4.name = 'Mariya';
  p4.subTitle = 'Shopping Time';
  p4.isSaved = false;
  p4.img = SNPost4;
  p4.userImg = SNUser4;
  p4.totalLike = Random.secure().nextInt(1000);
  p4.totalComment = Random.secure().nextInt(100);
  p4.detail = LoremText;
  p4.isLike = true;
  p4.comment = [
    SNUserModel(name: 'jamis', img: SNUser5, comment: 'Like your photo'),
    SNUserModel(name: 'Nora', img: SNUser2, comment: 'Like your photo'),
  ];
  list.add(p4);

  SNPostModel p5 = SNPostModel();
  p5.name = 'Antonio';
  p5.subTitle = 'Shopping Time';
  p5.isSaved = false;
  p5.img = SNPost5;
  p5.userImg = SNUser5;
  p5.totalLike = Random.secure().nextInt(1000);
  p5.totalComment = Random.secure().nextInt(100);
  p5.detail = LoremText;
  p5.comment = [
    SNUserModel(name: 'John Smith', img: SNUser4, comment: 'Like your photo'),
  ];
  list.add(p5);

  SNPostModel p6 = SNPostModel();
  p6.name = 'Alexei';
  p6.subTitle = 'Shopping Time';
  p6.isSaved = false;
  p6.img = SNPost6;
  p6.userImg = SNPost1;
  p6.totalLike = Random.secure().nextInt(1000);
  p6.totalComment = Random.secure().nextInt(100);
  p6.detail = LoremText;
  p6.comment = [
    SNUserModel(name: 'John Smith', img: SNUser2, comment: 'Like your photo'),
    SNUserModel(name: 'Mariya', img: SNUser3, comment: 'Nice Photo'),
    SNUserModel(name: 'jamis', img: SNUser4, comment: 'Like your photo'),
    SNUserModel(name: 'Nora', img: SNUser1, comment: 'Like your photo'),
  ];
  list.add(p6);

  SNPostModel p7 = SNPostModel();
  p7.name = '___MR__PATEL___';
  p7.subTitle = 'Shopping Time';
  p7.isSaved = false;
  p7.img = SNPost7;
  p7.userImg = SNPost2;
  p7.totalLike = Random.secure().nextInt(1000);
  p7.totalComment = Random.secure().nextInt(100);
  p7.detail = LoremText;
  p7.isLike = true;
  p7.comment = [
    SNUserModel(name: 'John Smith', img: SNUser2, comment: 'Like your photo'),
    SNUserModel(name: 'Mariya', img: SNUser3, comment: 'Nice Photo'),
    SNUserModel(name: 'jamis', img: SNUser1, comment: 'Like your photo'),
    SNUserModel(name: 'Nora', img: SNUser4, comment: 'Like your photo'),
  ];
  list.add(p7);

  SNPostModel p8 = SNPostModel();
  p8.name = 'Mr_Cool';
  p8.subTitle = 'Shopping Time';
  p8.isSaved = false;
  p8.img = SNPost8;
  p8.userImg = SNPost3;
  p8.totalLike = Random.secure().nextInt(1000);
  p8.totalComment = Random.secure().nextInt(100);
  p8.detail = LoremText;
  p8.comment = [
    SNUserModel(name: 'John Smith', img: SNUser1, comment: 'Like your photo'),
    SNUserModel(name: 'Mariya', img: SNUser2, comment: 'Nice Photo'),
    SNUserModel(name: 'jamis', img: SNUser3, comment: 'Like your photo'),
    SNUserModel(name: 'Nora', img: SNUser5, comment: 'Like your photo'),
  ];
  list.add(p8);

  SNPostModel p9 = SNPostModel();
  p9.name = 'Mr_Candi';
  p9.subTitle = '';
  p9.isSaved = false;
  p9.img = SNPost9;
  p9.userImg = SNPost4;
  p9.totalLike = Random.secure().nextInt(1000);
  p9.totalComment = Random.secure().nextInt(100);
  p9.detail = LoremText;
  p9.comment = [
    SNUserModel(name: 'Nora', img: SNUser5, comment: 'Like your photo'),
  ];
  list.add(p9);

  SNPostModel p10 = SNPostModel();
  p10.name = 'Elvina';
  p10.subTitle = '';
  p10.isSaved = true;
  p10.img = SNPost10;
  p10.userImg = SNUser5;
  p10.totalLike = Random.secure().nextInt(1000);
  p10.totalComment = Random.secure().nextInt(100);
  p10.detail = LoremText;
  p10.isLike = true;
  p10.comment = [
    SNUserModel(name: 'Nora', img: SNUser5, comment: 'Like your photo'),
  ];
  list.add(p10);

  SNPostModel p11 = SNPostModel();
  p11.name = 'Jacklin';
  p11.subTitle = '';
  p11.isSaved = true;
  p11.img = SNPost11;
  p11.userImg = SNUser6;
  p11.totalLike = Random.secure().nextInt(1000);
  p11.totalComment = Random.secure().nextInt(100);
  p11.detail = LoremText;
  p11.comment = [
    SNUserModel(name: 'A.Khan', img: SNUser5, comment: 'Like your photo'),
  ];
  list.add(p11);

  return list;
}

List<SNActivityModel> getActivityList() {
  List<SNActivityModel> list = [];

  SNActivityModel a1 = SNActivityModel();
  a1.name = 'Nora';
  a1.comment = 'like your photo';
  a1.userImg = SNUser1;
  a1.time = 'Now';
  list.add(a1);

  SNActivityModel a2 = SNActivityModel();
  a2.name = 'Smith John';
  a2.comment = 'comment on your photo Nice Photo comment on your photo Nice Photo';
  a2.userImg = SNUser2;
  a2.commentImg = SNPost1;
  a2.time = 'Now';
  list.add(a2);

  SNActivityModel a3 = SNActivityModel();
  a3.name = 'Nora';
  a3.comment = 'like your photo';
  a3.userImg = SNUser3;
  a3.time = 'Now';
  list.add(a3);

  SNActivityModel a4 = SNActivityModel();
  a4.name = 'William';
  a4.comment = 'like your photo';
  a4.userImg = SNUser4;
  a4.time = 'Now';
  list.add(a4);

  SNActivityModel a5 = SNActivityModel();
  a5.name = 'Benjamin';
  a5.comment = 'comment on your photo Nice Photo comment on your photo Nice Photo';
  a5.userImg = SNUser5;
  a5.time = 'Now';
  list.add(a5);

  SNActivityModel a6 = SNActivityModel();
  a6.name = 'Emma';
  a6.comment = 'like your photo';
  a6.userImg = SNUser6;
  a6.time = 'Now';
  list.add(a6);

  SNActivityModel a7 = SNActivityModel();
  a7.name = 'Isabella';
  a7.comment = 'like your photo';
  a7.userImg = SNUser7;
  a7.time = 'Now';
  list.add(a7);

  SNActivityModel a8 = SNActivityModel();
  a8.name = 'Smith';
  a8.comment = 'like your photo';
  a8.userImg = SNPost1;
  a8.time = 'Now';
  list.add(a8);
  return list;
}

List<SNChatModel> getChatData() {
  List<SNChatModel> list = [];

  SNChatModel c1 = SNChatModel();
  c1.name = 'William';
  c1.nickName = 'William_045';
  c1.img = SNUser1;
  c1.time = 'online';
  c1.lastMsg = LoremText;
  c1.unreadCount = Random().nextInt(20);
  c1.isActive = true;
  list.add(c1);

  SNChatModel c2 = SNChatModel();
  c2.name = 'Benjamin';
  c2.nickName = '___Benjamin___';
  c2.img = SNUser2;
  c2.time = '10 min ago';
  c2.lastMsg = LoremText;
  c2.unreadCount = Random().nextInt(20);
  list.add(c2);

  SNChatModel c3 = SNChatModel();
  c3.name = 'Emma';
  c3.nickName = 'Emma_123';
  c3.img = SNUser4;
  c3.time = 'online';
  c3.lastMsg = LoremText;
  c3.unreadCount = Random().nextInt(20);
  c3.isActive = true;
  list.add(c3);

  SNChatModel c4 = SNChatModel();
  c4.name = 'Isabella';
  c4.nickName = '__ISABELLA__';
  c4.img = SNUser2;
  c4.time = '2 day ago';
  c4.lastMsg = LoremText;
  c4.unreadCount = Random().nextInt(20);
  list.add(c4);

  SNChatModel c5 = SNChatModel();
  c5.name = 'John Smith';
  c5.nickName = '_John_Smith_187';
  c5.img = SNUser4;
  c5.time = '1 min ago';
  c5.lastMsg = LoremText;
  c5.unreadCount = Random().nextInt(20);
  list.add(c5);

  return list;
}

List<SNMessageModel> getChatMsgData() {
  List<SNMessageModel> list = [];

  SNMessageModel c1 = SNMessageModel();
  c1.senderId = sender_id;
  c1.receiverId = receiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  SNMessageModel c2 = SNMessageModel();
  c2.senderId = sender_id;
  c2.receiverId = receiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  SNMessageModel c3 = SNMessageModel();
  c3.senderId = receiver_id;
  c3.receiverId = sender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  SNMessageModel c4 = SNMessageModel();
  c4.senderId = sender_id;
  c4.receiverId = receiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  SNMessageModel c5 = SNMessageModel();
  c5.senderId = sender_id;
  c5.receiverId = receiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  SNMessageModel c6 = SNMessageModel();
  c6.senderId = receiver_id;
  c6.receiverId = sender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  SNMessageModel c7 = SNMessageModel();
  c7.senderId = sender_id;
  c7.receiverId = receiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  SNMessageModel c8 = SNMessageModel();
  c8.senderId = receiver_id;
  c8.receiverId = sender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  SNMessageModel c9 = SNMessageModel();
  c9.senderId = sender_id;
  c9.receiverId = receiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  SNMessageModel c10 = SNMessageModel();
  c10.senderId = receiver_id;
  c10.receiverId = sender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  SNMessageModel c11 = SNMessageModel();
  c11.senderId = receiver_id;
  c11.receiverId = sender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  SNMessageModel c12 = SNMessageModel();
  c12.senderId = sender_id;
  c12.receiverId = receiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  SNMessageModel c13 = SNMessageModel();
  c13.senderId = sender_id;
  c13.receiverId = receiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  SNMessageModel c14 = SNMessageModel();
  c14.senderId = receiver_id;
  c14.receiverId = sender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  SNMessageModel c15 = SNMessageModel();
  c15.senderId = sender_id;
  c15.receiverId = receiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  SNMessageModel c16 = SNMessageModel();
  c16.senderId = receiver_id;
  c16.receiverId = sender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  SNMessageModel c17 = SNMessageModel();
  c17.senderId = sender_id;
  c17.receiverId = receiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  SNMessageModel c18 = SNMessageModel();
  c18.senderId = receiver_id;
  c18.receiverId = sender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

List<SNSavedModel> getSavedList() {
  List<SNSavedModel> list = [];

  SNSavedModel s1 = SNSavedModel();
  s1.img = SNPost1;
  s1.totalCommentCount = 100;
  s1.totalLikeCount = '1.2k';
  list.add(s1);

  SNSavedModel s2 = SNSavedModel();
  s2.img = SNPost2;
  s2.totalCommentCount = 100;
  s2.totalLikeCount = '1.2k';
  list.add(s2);

  SNSavedModel s3 = SNSavedModel();
  s3.img = SNPost3;
  s3.totalCommentCount = 100;
  s3.totalLikeCount = '1.2k';
  list.add(s3);

  SNSavedModel s4 = SNSavedModel();
  s4.img = SNPost2;
  s4.totalCommentCount = 100;
  s4.totalLikeCount = '1.2k';
  list.add(s4);

  SNSavedModel s5 = SNSavedModel();
  s5.img = SNPost1;
  s5.totalCommentCount = 100;
  s5.totalLikeCount = '1.2k';
  list.add(s5);

  SNSavedModel s6 = SNSavedModel();
  s6.img = SNPost3;
  s6.totalCommentCount = 100;
  s6.totalLikeCount = '1.2k';
  list.add(s6);

  SNSavedModel s7 = SNSavedModel();
  s7.img = SNPost3;
  s7.totalCommentCount = 100;
  s7.totalLikeCount = '1.2k';
  list.add(s7);

  SNSavedModel s8 = SNSavedModel();
  s8.img = SNPost2;
  s8.totalCommentCount = 100;
  s8.totalLikeCount = '1.2k';
  list.add(s8);

  SNSavedModel s9 = SNSavedModel();
  s9.img = SNPost3;
  s9.totalCommentCount = 100;
  s9.totalLikeCount = '1.2k';
  list.add(s9);

  SNSavedModel s10 = SNSavedModel();
  s10.img = SNPost1;
  s10.totalCommentCount = 100;
  s10.totalLikeCount = '1.2k';
  list.add(s10);
  return list;
}

List<SNEditProfileModel> getEditProfileOptionList() {
  List<SNEditProfileModel> list = [];

  SNEditProfileModel e1 = SNEditProfileModel();
  e1.title = Edit_Profile;
  e1.isSelected = false;
  list.add(e1);

  SNEditProfileModel e2 = SNEditProfileModel();
  e2.title = Change_Password;
  e2.isSelected = false;
  list.add(e2);

  SNEditProfileModel e3 = SNEditProfileModel();
  e3.title = App_Websites;
  e3.isSelected = false;
  list.add(e3);

  SNEditProfileModel e4 = SNEditProfileModel();
  e4.title = Email_SMS;
  e4.isSelected = false;
  list.add(e4);

  SNEditProfileModel e5 = SNEditProfileModel();
  e5.title = Push_Notification;
  e5.isSelected = false;
  list.add(e5);

  SNEditProfileModel e6 = SNEditProfileModel();
  e6.title = Manage_Contacts;
  e6.isSelected = false;
  list.add(e6);

  SNEditProfileModel e7 = SNEditProfileModel();
  e7.title = Privacy_Security;
  e7.isSelected = false;
  list.add(e7);

  SNEditProfileModel e8 = SNEditProfileModel();
  e8.title = Login_Activity;
  e8.isSelected = false;
  list.add(e8);

  SNEditProfileModel e9 = SNEditProfileModel();
  e9.title = Email_Inst;
  e9.isSelected = false;
  list.add(e9);

  return list;
}

List<SNAccountModel> getAccountList() {
  List<SNAccountModel> list = [];

  SNAccountModel a1 = SNAccountModel();
  a1.name = 'Smith_John0667';
  a1.profileImg = SNUser1;
  a1.selected = true;
  list.add(a1);

  SNAccountModel a2 = SNAccountModel();
  a2.name = 'Kitkat_058';
  a2.profileImg = SNUser3;
  list.add(a2);

  return list;
}

List<SNProfileSideDrawerModel> getProfileSideDrawerList() {
  List<SNProfileSideDrawerModel> list = [];

  SNProfileSideDrawerModel s1 = SNProfileSideDrawerModel();
  s1.name = Archive;
  s1.icon = Ionicons.ios_timer;
  list.add(s1);

  SNProfileSideDrawerModel s2 = SNProfileSideDrawerModel();
  s2.name = Your_Activity;
  s2.icon = Ionicons.ios_timer;
  list.add(s2);

  SNProfileSideDrawerModel s3 = SNProfileSideDrawerModel();
  s3.name = QR_code;
  s3.icon = MaterialCommunityIcons.qrcode_scan;
  list.add(s3);

  SNProfileSideDrawerModel s4 = SNProfileSideDrawerModel();
  s4.name = Saved;
  s4.icon = FontAwesome.bookmark_o;
  list.add(s4);

  SNProfileSideDrawerModel s5 = SNProfileSideDrawerModel();
  s5.name = Close_friends;
  s5.icon = Feather.list;
  list.add(s5);

  SNProfileSideDrawerModel s6 = SNProfileSideDrawerModel();
  s6.name = Discover_people;
  s6.icon = Ionicons.ios_person_add;
  list.add(s6);

  return list;
}

List<SNSettingModel> getSettingItemList() {
  List<SNSettingModel> list = [];

  SNSettingModel s1 = SNSettingModel();
  s1.name = 'Follow and invite friends';
  s1.icon = sn_IconAccount;
  s1.screenWidget = SNInviteFollowFriendScreen();
  list.add(s1);

  SNSettingModel s2 = SNSettingModel();
  s2.name = 'Notifications';
  s2.icon = sn_IconNotification;
  s2.screenWidget = SNNotificationScreen();
  list.add(s2);

  SNSettingModel s3 = SNSettingModel();
  s3.name = 'Privacy';
  s3.icon = sn_IconLock;
  s3.screenWidget = SNPrivacyScreen();
  list.add(s3);

  SNSettingModel s4 = SNSettingModel();
  s4.name = 'Security';
  s4.icon = sn_IconVerified;
  s4.screenWidget = SNSecurityScreen();
  list.add(s4);

  SNSettingModel s5 = SNSettingModel();
  s5.name = 'Ads';
  s5.icon = sn_IconPromotion;
  s5.screenWidget = SNAdsScreen();
  list.add(s5);

  SNSettingModel s6 = SNSettingModel();
  s6.name = 'Account';
  s6.icon = sn_IconAccount;
  s6.screenWidget = SNAccountScreen();
  list.add(s6);

  SNSettingModel s7 = SNSettingModel();
  s7.name = 'Help';
  s7.icon = sn_IconQuestion;
  s7.screenWidget = SNHelpScreen();
  list.add(s7);

  SNSettingModel s8 = SNSettingModel();
  s8.name = 'About';
  s8.icon = sn_IconInfo;
  s8.screenWidget = SNHelpScreen();
  list.add(s8);

  SNSettingModel s9 = SNSettingModel();
  s9.name = 'Theme';
  s9.icon = sn_IconPaint;
  s9.screenWidget = SNSetThemeScreen();
  list.add(s9);

  return list;
}

List<SNSettingModel> getLoginSecurityItem() {
  List<SNSettingModel> list = [];

  SNSettingModel s1 = SNSettingModel();
  s1.name = 'password';
  s1.icon = sn_IconPassword;
  s1.screenWidget = SNChangePasswordScreen();
  list.add(s1);

  SNSettingModel s2 = SNSettingModel();
  s2.name = 'Login Activity';
  s2.icon = sn_IconLoginActivity;
  list.add(s2);

  SNSettingModel s3 = SNSettingModel();
  s3.name = 'Saved login information';
  s3.icon = sn_IconSaveLogin;
  list.add(s3);

  SNSettingModel s4 = SNSettingModel();
  s4.name = 'Two-factor authentication';
  s4.icon = sn_IconSmartphone;
  list.add(s4);

  SNSettingModel s5 = SNSettingModel();
  s5.name = 'Emails from Instagram';
  s5.icon = sn_IconEmail;
  list.add(s5);

  return list;
}

List<SNSettingModel> getDataHistoryItem() {
  List<SNSettingModel> list = [];

  SNSettingModel s1 = SNSettingModel();
  s1.name = 'Access data';
  s1.icon = sn_IconAccess;
  list.add(s1);

  SNSettingModel s2 = SNSettingModel();
  s2.name = 'Download data';
  s2.icon = sn_IconDownload;
  list.add(s2);

  SNSettingModel s3 = SNSettingModel();
  s3.name = 'Apps and websites';
  s3.icon = sn_IconPhoneWeb;
  list.add(s3);

  SNSettingModel s4 = SNSettingModel();
  s4.name = 'Search History';
  s4.icon = sn_IconSearch;
  list.add(s4);

  return list;
}

List<SNProfileSideDrawerModel> getInviteFriendItem() {
  List<SNProfileSideDrawerModel> list = [];

  SNProfileSideDrawerModel s1 = SNProfileSideDrawerModel();
  s1.name = 'Follow contacts';
  s1.icon = Ionicons.md_person_add;
  list.add(s1);

  SNProfileSideDrawerModel s2 = SNProfileSideDrawerModel();
  s2.name = 'Invite friends by email';
  s2.icon = Fontisto.email;
  list.add(s2);

  SNProfileSideDrawerModel s3 = SNProfileSideDrawerModel();
  s3.name = 'Invite friends via SMS';
  s3.icon = AntDesign.message1;
  list.add(s3);

  SNProfileSideDrawerModel s4 = SNProfileSideDrawerModel();
  s4.name = 'Invite friends via...';
  s4.icon = Entypo.share;
  list.add(s4);

  return list;
}

List<SNSettingModel> getInteractionList() {
  List<SNSettingModel> list = [];
  SNSettingModel s1 = SNSettingModel();
  s1.name = 'Comments';
  s1.subTitle = 'Everyone';
  s1.icon = sn_IconChat;
  list.add(s1);

  SNSettingModel s2 = SNSettingModel();
  s2.name = 'Tags';
  s2.subTitle = 'Everyone';
  s2.icon = sn_IconTags;
  list.add(s2);

  SNSettingModel s3 = SNSettingModel();
  s3.name = 'Mentions';
  s3.subTitle = 'Everyone';
  s3.icon = sn_IconMentions;
  list.add(s3);

  SNSettingModel s4 = SNSettingModel();
  s4.name = 'Story';
  s4.icon = sn_IconStory;
  list.add(s4);

  SNSettingModel s5 = SNSettingModel();
  s5.name = 'Activity status';
  s5.icon = sn_IconActivity;
  list.add(s5);

  SNSettingModel s6 = SNSettingModel();
  s6.name = 'Messages';
  s6.icon = sn_IconMsg;
  list.add(s6);
  return list;
}

List<SNSettingModel> getConnectionList() {
  List<SNSettingModel> list = [];
  SNSettingModel s1 = SNSettingModel();
  s1.name = 'Restricted accounts';
  s1.icon = sn_IconRestrictedUser;
  list.add(s1);

  SNSettingModel s2 = SNSettingModel();
  s2.name = 'Blocked accounts';
  s2.icon = sn_IconBlock;
  list.add(s2);

  SNSettingModel s3 = SNSettingModel();
  s3.name = 'Muted accounts';
  s3.icon = sn_IconMuteNotification;
  list.add(s3);

  SNSettingModel s4 = SNSettingModel();
  s4.name = 'Account you follow';
  s4.icon = sn_IconAccount;
  list.add(s4);

  return list;
}

List<SNSettingModel> getAccountItemList() {
  List<SNSettingModel> list = [];
  SNSettingModel s1 = SNSettingModel();
  s1.name = 'Your activity';
  list.add(s1);

  SNSettingModel s2 = SNSettingModel();
  s2.name = 'Saved';
  list.add(s2);

  SNSettingModel s3 = SNSettingModel();
  s3.name = 'Close friends';
  list.add(s3);

  SNSettingModel s4 = SNSettingModel();
  s4.name = 'Language';
  list.add(s4);

  SNSettingModel s5 = SNSettingModel();
  s5.name = 'Captions';
  list.add(s5);

  SNSettingModel s6 = SNSettingModel();
  s6.name = 'Browser auto-fill';
  list.add(s6);

  SNSettingModel s7 = SNSettingModel();
  s7.name = 'Browser auto-fill';
  list.add(s7);

  SNSettingModel s8 = SNSettingModel();
  s8.name = 'Contacts syncing';
  list.add(s8);

  SNSettingModel s9 = SNSettingModel();
  s9.name = 'Sharing to other apps';
  list.add(s9);

  SNSettingModel s10 = SNSettingModel();
  s10.name = 'Mobile data used';
  list.add(s10);

  SNSettingModel s11 = SNSettingModel();
  s11.name = 'Original posts';
  list.add(s11);

  SNSettingModel s12 = SNSettingModel();
  s12.name = 'Request Verification';
  list.add(s12);

  SNSettingModel s13 = SNSettingModel();
  s13.name = 'Post you\'ve liked';
  list.add(s13);

  SNSettingModel s14 = SNSettingModel();
  s14.name = 'Branded content tools';
  list.add(s14);

  return list;
}

List<SNEmailSMSModel> getSetThemeList() {
  List<SNEmailSMSModel> list = [];

  SNEmailSMSModel s1 = SNEmailSMSModel();
  s1.title = 'Light';
  s1.isSelected = false;
  list.add(s1);

  SNEmailSMSModel s2 = SNEmailSMSModel();
  s2.title = 'Dark';
  s2.isSelected = false;
  list.add(s2);

  SNEmailSMSModel s3 = SNEmailSMSModel();
  s3.title = 'System Default';
  list.add(s3);

  return list;
}

ObservableList<SNCommentModel> getCommentList() {
  ObservableList<SNCommentModel> list = ObservableList();
  SNCommentModel c1 = SNCommentModel();
  c1.name = 'William';
  c1.userImg = SNUser2;
  c1.time = '1 hour ago';
  c1.likes = 25;
  c1.comment = 'Nice Photo.. 😎😎';

  ObservableList<SNCommentModel> subComments = ObservableList();
  subComments.add(SNCommentModel(name: 'John Smith', userImg: SNUser1, likes: 1, time: '2 min ago', comment: 'Thank you @John Smith.. 🙃🙃'));
  subComments.add(SNCommentModel(name: 'John Smith', userImg: SNUser1, likes: 1, time: '2 min ago', comment: 'Thank you @John Smith.. 🙃🙃'));
  c1.subComment = subComments;
  list.add(c1);

  SNCommentModel c2 = SNCommentModel();
  c2.name = 'Nora Joe';
  c2.userImg = SNUser2;
  c2.time = '1 hour ago';
  c2.likes = 25;
  c2.comment = 'Nice Photo.. 😎😎';
  list.add(c2);

  log(list.length);
  return list;
}

List<SNSearchModel> getSearchList() {
  List<SNSearchModel> list = [];
  SNSearchModel s1 = SNSearchModel();
  s1.name = 'William';
  s1.subTitle = 'William_021 😎';
  s1.userImg = SNUser1;
  s1.posts = Random.secure().nextInt(100);
  s1.follower = Random.secure().nextInt(30);
  s1.following = Random.secure().nextInt(60);
  s1.isFollow = true;
  list.add(s1);

  SNSearchModel s2 = SNSearchModel();
  s2.name = 'Isabella';
  s2.subTitle = '__Isabella__58';
  s2.userImg = SNUser3;
  s2.posts = Random.secure().nextInt(10);
  s2.follower = Random.secure().nextInt(50);
  s2.following = Random.secure().nextInt(20);
  s2.isFollow = true;
  s2.isVerifyAccount = true;
  list.add(s2);

  SNSearchModel s3 = SNSearchModel();
  s3.name = 'Benjamin';
  s3.subTitle = 'Benjamin_14';
  s3.userImg = SNUser2;
  s3.posts = Random.secure().nextInt(30);
  s3.follower = Random.secure().nextInt(90);
  s3.following = Random.secure().nextInt(20);
  s3.isFollow = true;
  list.add(s3);

  SNSearchModel s4 = SNSearchModel();
  s4.name = 'Emma';
  s4.subTitle = 'Emma_Joe_88';
  s4.userImg = SNUser4;
  s4.posts = Random.secure().nextInt(20);
  s4.follower = Random.secure().nextInt(10);
  s4.following = Random.secure().nextInt(80);
  list.add(s4);

  SNSearchModel s5 = SNSearchModel();
  s5.name = 'James';
  s5.subTitle = '_James_';
  s5.userImg = SNUser5;
  s5.posts = Random.secure().nextInt(100);
  s5.follower = Random.secure().nextInt(30);
  s5.following = Random.secure().nextInt(60);
  list.add(s5);

  SNSearchModel s6 = SNSearchModel();
  s6.name = 'Charlotte';
  s6.subTitle = 'Charlotte_121';
  s6.userImg = SNUser6;
  s6.posts = Random.secure().nextInt(100);
  s6.follower = Random.secure().nextInt(30);
  s6.following = Random.secure().nextInt(60);
  s6.isFollow = true;
  list.add(s6);
  return list;
}
