import 'package:cit_club/splash_screen.dart';
import 'package:cit_club/views/login_view.dart';
import 'package:cit_club/views/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:cit_club/constraints/routes.dart';

//the run function builds the appu
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CIT club app',
        home: Registerview(),
        //declaring the routes to different views
        routes: {
          splashScreen: (context) => AnimationPage(),
          loginView: (context) => Loginview(),
          registerView: (context) => Registerview(),
        });
  }
}
