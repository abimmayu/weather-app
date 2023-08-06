import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/common/common.dart';

class CardWeatherperHour extends StatelessWidget {
  const CardWeatherperHour({
    super.key,
    this.height,
    this.width,
    this.padding,
    required this.upperText,
    required this.upperTextColor,
    required this.image,
    this.iconHeight,
    this.iconWidth,
    required this.bottomText,
    required this.bottomTextColor,
  });

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final String upperText;
  final Color upperTextColor;
  final String image;
  final double? iconHeight;
  final double? iconWidth;
  final String bottomText;
  final Color bottomTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(24),
            vertical: ScreenUtil().setHeight(36),
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OriginTextStyle().normalTextStyle(
            text: upperText,
            color: upperTextColor,
          ),
          Flexible(
            child: Container(
              height: iconHeight ?? ScreenUtil().setWidth(108),
              width: iconWidth ?? ScreenUtil().setWidth(108),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          OriginTextStyle().normalTextStyle(
            text: bottomText,
            color: bottomTextColor,
          ),
        ],
      ),
    );
  }
}
