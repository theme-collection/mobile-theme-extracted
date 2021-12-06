import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:imail_flutter/main.dart';
import 'package:imail_flutter/model/GMModel.dart';
import 'package:imail_flutter/screen/GMMailDetailScreen.dart';
import 'package:imail_flutter/utils/AppWidget.dart';
import 'package:imail_flutter/utils/GMColors.dart';
import 'package:imail_flutter/utils/GMDataProvider.dart';
import 'package:imail_flutter/utils/multi_select_item.dart';
import 'package:nb_utils/nb_utils.dart';

class DashBoardListComponent extends StatefulWidget {
  final List<GMMailModel?>? getMailList;

  @override
  _DashBoardListComponentState createState() => _DashBoardListComponentState();

  DashBoardListComponent({this.getMailList});
}

class _DashBoardListComponentState extends State<DashBoardListComponent> {
  MultiSelectController controller = MultiSelectController();

  List colors = [getColorFromHex('#5E97F6'), getColorFromHex('#4DD0E1'), getColorFromHex('#F06292'), getColorFromHex('#F6BF26')];
  SlidableController? slidableController;

  bool? isSelected;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    controller.disableEditingWhenNoneSelected = true;
    controller.set(widget.getMailList!.length);
  }

  static Widget? _getActionPane(int index) {
    switch (index % 4) {
      case 0:
        return SlidableBehindActionPane();
      case 1:
        return SlidableStrechActionPane();
      case 2:
        return SlidableScrollActionPane();
      case 3:
        return SlidableDrawerActionPane();
      default:
        return null;
    }
  }

  _moveToDialog(BuildContext context, GMMailModel data) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Move to', style: boldTextStyle(size: 20)),
            contentPadding: EdgeInsets.all(16),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    16.width,
                    Text('Social', style: primaryTextStyle()),
                  ],
                ).onTap(() {
                  toast('Move to Social', gravity: ToastGravity.BOTTOM);
                  finish(context);
                  socialList.add(data);
                }),
                20.height,
                Row(
                  children: [
                    Icon(AntDesign.tago),
                    16.width,
                    Text('Promotions', style: primaryTextStyle()),
                  ],
                ).onTap(() {
                  toast('Move to Promotions', gravity: ToastGravity.BOTTOM);
                  finish(context);
                  promotionsList.add(data);
                }),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  finish(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.getMailList!.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 8),
        itemBuilder: (BuildContext context, int index) {
          GMMailModel data = widget.getMailList![index]!;
          return Slidable(
            actionPane: _getActionPane(index)!,
            controller: slidableController,
            key: Key(data.name.validate()),
            actionExtentRatio: 0.25,
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
              onDismissed: (actionType) {
                toast(actionType == SlideActionType.primary ? 'Dismiss Archive' : 'Delete Successful');
                setState(() {
                  widget.getMailList!.remove(data);
                });
              },
            ),
            actions: [
              IconSlideAction(
                  color: GMBlueColor,
                  icon: AntDesign.download,
                  onTap: () {
                    _moveToDialog(context, data);
                  }),
            ],
            secondaryActions: [
              IconSlideAction(
                color: GMRedColor,
                icon: AntDesign.delete,
                onTap: () {
                  widget.getMailList!.remove(data);
                  binList.add(data);
                  setState(() {});
                },
              ),
            ],
            child: MultiSelectItem(
              isSelecting: controller.isSelecting,
              onSelected: () {
                setState(() {
                  isMultiSelect = true;
                  controller.toggle(index);
                  print('multiSelectList:-${(index)}');
                  multiSelectedList.add(getMailList[index]);
                  print(multiSelectedList.length);
                  multiSelectedList.forEach((element) {
                    print(element!.name);
                  });
                });
              },
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                width: context.width(),
                decoration: boxDecoration(bgColor: controller.isSelected(index) ? grey.withOpacity(0.2) : Colors.transparent),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: colors[index % colors.length]),
                      child: Text('${data.name![0].validate()}', style: boldTextStyle(size: 22, color: Colors.white)).center(),
                    ),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data.name.validate(), style: boldTextStyle(color: data.name.validate() == 'Draft' ? GMRedColor : GMBlackColor)),
                            Text(data.dateTime.validate(), style: boldTextStyle(color: GMBlackColor, size: 12)),
                          ],
                        ),
                        Text(data.title!, style: boldTextStyle(color: GMBlackColor, size: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data.description!, style: secondaryTextStyle(size: 14), maxLines: 1, overflow: TextOverflow.ellipsis).expand(),
                            Icon(data.ratting ? Icons.star : Icons.star_border, color: data.ratting ? Colors.yellow : GMGreyColor, size: 20).onTap(() {
                              starredList.add(data);
                              setState(() {
                                data.ratting = !data.ratting;
                              });
                            }),
                          ],
                        ),
                      ],
                    ).expand(),
                  ],
                ),
              ).onTap(() {
                GMMailDetailScreen(data: data).launch(context);
              }),
            ),
          );
        });
  }
}
