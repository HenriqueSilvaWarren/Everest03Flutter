import 'dart:math';

import 'package:flutter/material.dart';

class ConversionAnimation extends StatelessWidget {
  ConversionAnimation({
    Key? key,
    required this.controller,
  })  : rotationX = Tween<double>(begin: 0, end: pi * 2).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.5,
            ),
          ),
        ),
        rotationZ = Tween<double>(begin: 0, end: pi).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.5,
              0.75,
              curve: Curves.easeInOutSine,
            ),
          ),
        ),
        super(key: key);

  final Animation<double> controller;
  final Animation<double> rotationX;
  final Animation<double> rotationZ;

  final List<Widget> stackChildren = [
    Transform(
      transform: Matrix4.identity()..rotateX(pi),
      alignment: Alignment.center,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(214, 255, 223, 1), //Colors.black,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color.fromARGB(255, 186, 255, 202),
            width: 5,
          ),
        ),
        child: const Icon(
          Icons.attach_money,
          color: Color.fromRGBO(12, 95, 44, 1),
          size: 36,
        ),
      ),
    ),
    Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(214, 255, 223, 1), //Colors.black,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color.fromARGB(255, 186, 255, 202),
          width: 5,
        ),
      ),
      child: const Icon(
        Icons.check,
        color: Color.fromRGBO(12, 95, 44, 1),
        size: 36,
      ),
    ),
  ];

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Transform(
      transform: Matrix4.rotationX(rotationX.value)..rotateZ(rotationZ.value),
      alignment: Alignment.center,
      child: Transform(
        transform: Matrix4.rotationZ(rotationZ.value),
        alignment: Alignment.center,
        child: stackChildren[controller.value >= 0.50 * 0.26666666666 &&
                controller.value <= 0.50 * 0.73333333333
            ? 0
            : 1],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
