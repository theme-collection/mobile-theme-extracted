import 'package:event_flutter/model/EAReviewModel.dart';
import 'package:event_flutter/screens/PurchaseMoreScreen.dart';
import 'package:event_flutter/utils/EAColors.dart';
import 'package:event_flutter/utils/EADataProvider.dart';
import 'package:event_flutter/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EAReviewScreen extends StatefulWidget {
  const EAReviewScreen({Key? key}) : super(key: key);

  @override
  _EAReviewScreenState createState() => _EAReviewScreenState();
}

class _EAReviewScreenState extends State<EAReviewScreen> {
  List<EAReviewModel> list = reviewList();
  TextEditingController reviewController = TextEditingController();

  Widget slideLeftBackground() {
    return Container(
      color: primaryColor1,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Icon(Icons.arrow_back, color: Colors.white),
            10.width,
            const Icon(Icons.info_outline, color: Colors.white),
            20.width,
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Reviews',
          backWidget: const Icon(Icons.close, color: white).onTap(() {
            finish(context);
          }),
          center: true),
      body: const PurchaseMoreScreen(),
    );
  }
}
