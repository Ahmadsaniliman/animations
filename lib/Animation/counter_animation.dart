import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  const CounterAnimation({Key? key}) : super(key: key);

  @override
  State<CounterAnimation> createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animation = Tween(begin: 0.0, end: 5.0).animate(_controller)
      ..addListener(() {})
      ..addStatusListener((status) {});
    // animation = CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.decelerate,
    // );

    _controller.addListener(() {
      setState(() {
        _counter++;
      });
    });
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
        child: GestureDetector(
          onTap: () {
            _controller.forward(from: 0);
          },
          child: Text(
            _controller.isAnimating
                ? _counter.toStringAsFixed(2)
                : 'Let"s Begin',
            style: TextStyle(
              fontSize: 20.0 * _controller.value + 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
