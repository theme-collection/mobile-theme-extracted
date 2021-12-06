import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_flutter/utils/SocialColors.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchaseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Purchase for more screen',
      color: social_colorPrimary,
      textStyle: boldTextStyle(color: Colors.white),
      shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
      onTap: () {
        launch("https://codecanyon.net/item/prokit-flutter-app-ui-design-templete-kit/25787190?s_rank=19");
      },
    );
  }
}
