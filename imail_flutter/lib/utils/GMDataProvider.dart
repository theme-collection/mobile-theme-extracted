import 'package:flutter/material.dart';
import 'package:imail_flutter/main.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:imail_flutter/model/GMModel.dart';
import 'package:imail_flutter/screen/GMSettingScreen.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:nb_utils/nb_utils.dart';

List<GMMailModel?> getMailList = getDashboardList();

bool isSelect = false;

List<GMMailModel?> getDashboardList() {
  List<GMMailModel?> mailList = [];

  mailList.add(
    GMMailModel(
      name: 'Indeed',
      title: '1 new R & d engineer vacancy in surat 1 new R & d engineer vacancy in surat',
      description: 'Multi Recruit has opportunity for you',
      dateTime: '9:51 am',
    ),
  );
  mailList.add(
    GMMailModel(
      name: 'Zomato',
      title: 'Order now,Special offer for you',
      description: 'Who dose like something special Who dose like something special',
      dateTime: '8 Nov',
    ),
  );

  mailList.add(
    GMMailModel(
      name: 'LinkeIn',
      title: 'Rahul, wants to be your friend',
      description: 'Accept my invitation',
      dateTime: '8 Nov',
    ),
  );

  mailList.add(
    GMMailModel(
      name: 'Facebook',
      title: 'New Facebook feature update',
      description: 'Now Business video conferencing can be done through Facebook meeting',
      dateTime: '8 Nov',
    ),
  );
  mailList.add(
    GMMailModel(
      name: 'Flutter',
      title: "New Flutter App",
      description: "Just some quick thoughts...",
      dateTime: '8 Nov',
    ),
  );
  mailList.add(
    GMMailModel(
      name: 'Income Tax',
      title: "Taxes 2020",
      description: "What W2s do you need to complete taxes? I see the one from last year but not this year.",
      dateTime: '8 Nov',
    ),
  );
  mailList.add(
    GMMailModel(
      name: 'Geico Car insurance',
      title: "Save 10% with Geico",
      description: "15 minutes could save you 15% or more on Car Insurance.",
      dateTime: '8 Nov',
    ),
  );

  mailList.add(
    GMMailModel(
      name: 'Indeed',
      title: '1 new R & d engineer vacancy in surat 1 new R & d engineer vacancy in surat',
      description: 'Multi Recruit has opportunity for you',
      dateTime: '9:51 am',
    ),
  );
  mailList.add(
    GMMailModel(
      name: 'Zomato',
      title: 'Order now,Special offer for you',
      description: 'Who dose like something special Who dose like something special',
      dateTime: '8 Nov',
    ),
  );

  mailList.add(
    GMMailModel(
      name: 'LinkeIn',
      title: 'Rahul, wants to be your friend',
      description: 'Accept my invitation',
      dateTime: '8 Nov',
    ),
  );

  mailList.add(
    GMMailModel(
      name: 'Facebook',
      title: 'New Facebook feature update',
      description: 'Now Business video conferencing can be done through Facebook meeting',
      dateTime: '8 Nov',
    ),
  );
  mailList.add(
    GMMailModel(
      name: 'Flutter',
      title: "New Flutter App",
      description: "Just some quick thoughts...",
      dateTime: '8 Nov',
    ),
  );
  mailList.add(
    GMMailModel(
      name: 'Income Tax',
      title: "Taxes 2020",
      description: "What W2s do you need to complete taxes? I see the one from last year but not this year.",
      dateTime: '8 Nov',
    ),
  );
  mailList.add(
    GMMailModel(
      name: 'Geico Car insurance',
      title: "Save 10% with Geico",
      description: "15 minutes could save you 15% or more on Car Insurance.",
      dateTime: '8 Nov',
    ),
  );

  return mailList;
}

List<DrawerModel> getDrawerList(
  BuildContext context,
) {
  List<DrawerModel> drawerList = [];
  drawerList.add(DrawerModel(
    leading: Icon(Feather.inbox, color: GMBlackColor),
    title: 'All inboxes',
    list: getMailList,
  ));
  drawerList.add(DrawerModel(
    leading: Icon(AntDesign.inbox, color: GMBlackColor),
    title: 'Primary',
    trailing: Text('${getMailList.length}+', style: boldTextStyle(size: 12)),
    list: getMailList,
  ));
  drawerList.add(DrawerModel(
    leading: Icon(SimpleLineIcons.people, color: GMBlackColor),
    title: 'Social',
    list: socialList,
    trailing: Container(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: boxDecorationWithRoundedCorners(backgroundColor: GMRedColor, borderRadius: BorderRadius.circular(10)),
      child: Text('${socialList.length} new', style: boldTextStyle(color: GMWhiteColor, size: 10)),
    ),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(MaterialCommunityIcons.tag_outline, color: GMBlackColor),
    title: 'Promotion',
    list: promotionsList,
    trailing: Container(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: boxDecorationWithRoundedCorners(backgroundColor: GMBlueColor, borderRadius: BorderRadius.circular(10)),
      child: Text('${promotionsList.length} new', style: boldTextStyle(color: GMWhiteColor, size: 10)),
    ),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(Feather.info, color: GMBlackColor),
    title: 'Update',
    trailing: Container(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: boxDecorationWithRoundedCorners(backgroundColor: GMGreenColor, borderRadius: BorderRadius.circular(10)),
      child: Text('25 new', style: boldTextStyle(color: GMWhiteColor, size: 10)),
    ),
  ));

  drawerList.add(DrawerModel(
    leading: Icon(MaterialIcons.star_border, color: GMBlackColor),
    title: 'Starred',
    trailing: Text('${starredList.length}', style: boldTextStyle(size: 12)),
    list: starredList,
  ));
  drawerList.add(DrawerModel(
    leading: Icon(MaterialIcons.access_time, color: GMBlackColor),
    title: 'Snoozed',
    list: snoozingList,
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.label_variant_outline,
      color: GMBlackColor,
    ),
    title: 'Important',
    list: importantList,
    trailing: Text('${importantList.length}', style: boldTextStyle(size: 12)),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.send,
      color: GMBlackColor,
    ),
    title: 'Sent',
    list: getMailList,
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      Icons.schedule_send,
      color: GMBlackColor,
    ),
    title: 'Scheduled',
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.file_outline,
      color: GMBlackColor,
    ),
    title: 'Outbox',
  ));
  drawerList.add(DrawerModel(
    leading: Icon(Icons.star_border, color: GMBlackColor),
    title: 'Drafts',
    list: draftList,
    trailing: Text('${draftList.length}', style: boldTextStyle(size: 12)),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.email_open_multiple_outline,
      color: GMBlackColor,
    ),
    title: 'All mail',
    list: getMailList,
    trailing: Text('${getMailList.length}', style: boldTextStyle(size: 12)),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      SimpleLineIcons.info,
      color: GMBlackColor,
    ),
    title: 'Spam',
    trailing: Text('4', style: boldTextStyle(size: 12)),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.trash_can_outline,
      color: GMBlackColor,
    ),
    title: 'Bin',
    list: binList,
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.calendar_blank,
      color: GMBlackColor,
    ),
    title: 'Calendar',
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      Ionicons.ios_person,
      color: GMBlackColor,
    ),
    title: 'Contacts',
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      SimpleLineIcons.settings,
      color: GMBlackColor,
    ),
    title: 'Settings',
    screenName: GMSettingScreen(),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.help_circle_outline,
      color: GMBlackColor,
    ),
    title: 'Help and feedback',
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.email_open_multiple_outline,
      color: GMBlackColor,
    ),
    title: 'All mail',
    list: getMailList,
    trailing: Text('${getMailList.length}+', style: boldTextStyle(size: 12)),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      SimpleLineIcons.info,
      color: GMBlackColor,
    ),
    title: 'Spam',
    trailing: Text('4', style: boldTextStyle(size: 12)),
  ));
  drawerList.add(DrawerModel(
    leading: Icon(
      MaterialCommunityIcons.trash_can_outline,
      color: GMBlackColor,
    ),
    title: 'Bin',
    list: binList,
  ));

  return drawerList;
}

List<GMAccountModel> getAccountList() {
  List<GMAccountModel> accountList = [];
  accountList.add(GMAccountModel(firstLetter: 'D', name: 'Denial', mail: 'denial22@gmail.com', totalMail: '99+'));
  accountList.add(GMAccountModel(firstLetter: 'A', name: 'Ashley', mail: 'ahley22@gmail.com', totalMail: '99+'));

  return accountList;
}

List<GMSnoozeModel> getSnoozeGridList() {
  List<GMSnoozeModel> snoozeList = [];
  snoozeList.add(GMSnoozeModel(image: Feather.sun, day: 'Later Today', time: '18:00'));
  snoozeList.add(GMSnoozeModel(image: AntDesign.setting, day: 'Tomorrow', time: ' Thu 08:00'));
  snoozeList.add(GMSnoozeModel(image: Feather.briefcase, day: 'Later this week', time: 'Fri 02:00'));
  snoozeList.add(GMSnoozeModel(image: Feather.briefcase, day: 'This weekend', time: 'Sun 18:00'));
  snoozeList.add(GMSnoozeModel(image: Feather.briefcase, day: 'Next week', time: 'Mon 18:00'));
  snoozeList.add(GMSnoozeModel(image: Feather.calendar, day: 'Pick date & time', time: ''));

  return snoozeList;
}

List<GMSnoozeModel> getScheduleGridList() {
  List<GMSnoozeModel> scheduleList = [];
  scheduleList.add(GMSnoozeModel(image: AntDesign.setting, day: 'Tomorrow \n morning', time: '25 Nov, 8:00'));
  scheduleList.add(GMSnoozeModel(image: Feather.sun, day: 'This afternoon', time: '24 Nov, 1:00'));
  scheduleList.add(GMSnoozeModel(image: Feather.briefcase, day: 'Monday \n morning', time: '30 Nov, 8:00'));
  scheduleList.add(GMSnoozeModel(image: Feather.calendar, day: 'Pick date & time', time: ''));

  return scheduleList;
}

List<GMSnoozeModel> getMultiSelectSnoozeGridList() {
  List<GMSnoozeModel> scheduleList = [];
  scheduleList.add(GMSnoozeModel(image: AntDesign.setting, day: 'Tomorrow', time: '25 Nov, 8:00'));
  scheduleList.add(GMSnoozeModel(image: Feather.sun, day: 'This weekend', time: '24 Nov, 1:00'));
  scheduleList.add(GMSnoozeModel(image: Feather.briefcase, day: 'Next week', time: '30 Nov, 8:00'));
  scheduleList.add(GMSnoozeModel(image: Feather.calendar, day: 'Select date and \n time', time: ''));

  return scheduleList;
}

List<GMMailModel?> importantList = [];
List<GMMailModel?> socialList = [];
List<GMMailModel?> promotionsList = [];
List<GMMailModel?> starredList = [];
List<GMMailModel?> saveToDraftList = [];
List<GMMailModel?> multiSelectedList = [];
List<GMMailModel?> binList = [];
List<GMMailModel?> draftList = [];
