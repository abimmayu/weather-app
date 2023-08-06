import 'package:flutter/material.dart';

class ButtonChosenDay extends StatelessWidget {
  ButtonChosenDay({
    super.key,
    this.onTap,
    this.height,
    this.width,
    required this.color,
    this.radius,
    required this.child,
  });

  final Function()? onTap;
  final double? height;
  final double? width;
  Color color;
  final double? radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
          ),
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        child: child,
      ),
    );
  }
}
