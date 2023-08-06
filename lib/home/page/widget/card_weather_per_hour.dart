import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/common/common.dart';

class CardWeatherperHour extends StatelessWidget {
  const CardWeatherperHour({
    super.key,
    this.margin,
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

  final EdgeInsetsGeometry? margin;
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
      margin: margin ??
          EdgeInsets.only(
            right: ScreenUtil().setWidth(24),
            bottom: ScreenUtil().setHeight(36),
            top: ScreenUtil().setHeight(36),
          ),
      height: height,
      width: width,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(12),
          ),
      decoration: BoxDecoration(
        color: ColorPalatte().primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OriginTextStyle().normalTextStyle(
            text: upperText,
            color: upperTextColor,
            fontSize: ScreenUtil().setWidth(12),
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
