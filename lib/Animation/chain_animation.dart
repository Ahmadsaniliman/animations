import 'package:flutter/material.dart';

class ChaainAnimation extends AnimatedWidget {
  final _opacityTween = Tween(begin: 0.1, end: 1.0);
  final _sizeTween = Tween(begin: 0.0, end: 175.5);
  ChaainAnimation({
    Key? key,
    required Animation<double> animation,
    required Listenable listenable,
  }) : super(
          key: key,
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = Listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: SizedBox(
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Button'),
          ),
        ),
      ),
    );
  }
}

class ChainAnima extends StatefulWidget {
  const ChainAnima({Key? key}) : super(key: key);

  @override
  State<ChainAnima> createState() => _ChainAnimaState();
}

class _ChainAnimaState extends State<ChainAnima> with TickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChaainAnimation(
      animation: animation,
      listenable: animation,
    );
  }
}
