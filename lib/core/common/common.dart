import 'package:flutter/material.dart';

class OriginTextStyle {
  boldTextStyle({
    required String text,
    required Color color,
    EdgeInsetsGeometry? padding,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize ?? 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        textAlign: textAlign,
      ),
    );
  }

  normalTextStyle({
    required String text,
    required Color color,
    EdgeInsetsGeometry? padding,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize ?? 24.0,
          fontWeight: FontWeight.normal,
          fontFamily: 'Roboto',
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class ColorPalatte {
  Color primaryColor = Colors.white;
  Color backgroundColor = Colors.black;
  Color? greyColor = Colors.grey[800];
}
