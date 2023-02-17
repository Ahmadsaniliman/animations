import 'package:flutter/material.dart';

class CurveAnimation extends StatefulWidget {
  const CurveAnimation({Key? key}) : super(key: key);

  @override
  State<CurveAnimation> createState() => _CurveAnimationState();
}

class _CurveAnimationState extends State<CurveAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    )..addListener(() {
        setState(() {});
      });

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello Love',
          style: TextStyle(fontSize: 20.0 * _animation.value),
        ),
      ),
    );
  }
}
