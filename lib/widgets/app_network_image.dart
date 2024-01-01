import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/network_utils/network_utils.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? height, width;
  final double? borderRadius;
  final Alignment? alignment;
  final Color? borderColor;
  final Color? bgColor;
  final BoxShape? shape;
  final Widget? child;

  AppNetworkImage({
    required this.url,
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
    this.alignment,
    this.borderColor,
    this.bgColor,
    this.shape,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (NetworkUtils.baseUrl.replaceAll('/api/v1/', '')) + url,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          margin: EdgeInsets.symmetric(vertical: 0),
          child: child,
          decoration: BoxDecoration(
            // color: AppColors.kPrimary,
            image: DecorationImage(
                image: imageProvider, fit: fit ?? BoxFit.contain),
            borderRadius:
                shape == null ? BorderRadius.circular(borderRadius ?? 5) : null,
            shape: shape ?? BoxShape.rectangle,
            border:
                Border.all(color: borderColor ?? Colors.transparent, width: 1),
          ),
          alignment: alignment ?? Alignment.center),
      placeholder: (context, url) => SizedBox.shrink(),
      errorWidget: (context, url, error) => Icon(Icons.warning_amber_rounded),
    );
  }
}
