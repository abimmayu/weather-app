import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    required this.onTap,
    required this.icon,
    this.height,
    this.width,
  });

  final Function() onTap;
  final IconData icon;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0.2, 0.2),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Icon(icon),
      ),
    );
  }
}
