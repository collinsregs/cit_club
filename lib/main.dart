import 'package:cit_club/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cit_club/constraints/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'animations demo',
        home: AnimationPage(),
        routes: {
          splashScreen: (context) => AnimationPage(),
        });
  }
}
