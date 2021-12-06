import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget? Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);

Widget commonCacheImageWidget(String? url, double height, {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}
