import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/originals/03/e7/67/03e76725ad6f4b03f6ae97ece50e15fc.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
