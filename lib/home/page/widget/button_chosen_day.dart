import 'package:flutter/material.dart';

class ButtonChosenDay extends StatelessWidget {
  const ButtonChosenDay({
    super.key,
    this.onTap,
    required this.child,
    this.radius,
    this.height,
    this.width,
  });

  final Function()? onTap;
  final double? height;
  final double? width;
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
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        child: child,
      ),
    );
  }
}
