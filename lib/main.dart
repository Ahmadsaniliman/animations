import 'package:animations/Animation/counter_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      //   theme: ThemeData(),
      theme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const CounterAnimation(),
    );
  }
}
