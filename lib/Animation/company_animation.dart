import 'package:flutter/material.dart';

class ComapnyAnimations {
  final AnimationController controller;
  final Animation<double> bgdropOpcaity;
  final Animation<double> bgdropBlur;
  late final Animation<double> avatarSize;
  late final Animation<double> nameOpacity;
  late final Animation<double> locationOpacity;
  late final Animation<double> dividerWidth;
  late final Animation<double> aboutOpacity;
  late final Animation<double> courseScrollerXTransition;
  late final Animation<double> courseScrollerOpacity;

  ComapnyAnimations(this.controller)
      : bgdropOpcaity = Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.000,
            0.500,
            curve: Curves.ease,
          ),
        )),
        bgdropBlur = Tween(begin: 0.0, end: 5.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.000, 0.800, curve: Curves.ease),
          ),
        );
}
