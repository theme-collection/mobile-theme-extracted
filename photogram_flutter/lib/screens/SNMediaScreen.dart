import 'package:photogram_flutter/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photogram_flutter/model/SNModel.dart';
import 'package:photogram_flutter/utils/SNConstants.dart';
import 'package:photogram_flutter/utils/SNDataProvider.dart';
import 'package:photogram_flutter/utils/SNImages.dart';

class SNMediaScreen extends StatefulWidget {
  static String tag = '/SNMediaScreen';

  @override
  SNMediaScreenState createState() => SNMediaScreenState();
}

class SNMediaScreenState extends State<SNMediaScreen> {
  List<SNPostModel> postList = getPostList();
  String? selectedImg = SNPost1;

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close, size: 30),
            onPressed: () {
              finish(context);
            }),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Gallery', style: boldTextStyle()),
            8.width,
            Icon(Icons.keyboard_arrow_down),
          ],
        ).onTap(() {}),
        actions: [
          Text('NEXT', style: boldTextStyle(size: 16, color: Colors.blueAccent)).onTap(() {}).center().paddingRight(16),
        ],
      ),
      body: Responsive(
        web: Container(),
        mobile: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: context.height() * 0.45,
                width: context.width(),
                child: Stack(
                  children: [
                    commonCacheImageWidget(selectedImg, width: context.width(), height: context.height() * 0.5, fit: BoxFit.cover),
                  ],
                ),
              ),
              4.height,
              GridView.builder(
                itemCount: maxItemCount,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  SNPostModel data = postList[index % postList.length];
                  return commonCacheImageWidget(data.img, height: 180, width: 180, fit: BoxFit.cover).onTap(() {
                    selectedImg = postList[index % postList.length].img;
                    setState(() {});
                  });
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
