import 'package:cit_club/firebase_options.dart';
import 'package:cit_club/splash_screen.dart';
import 'package:cit_club/views/login_view.dart';
import 'package:cit_club/views/main_Page.dart';
import 'package:cit_club/views/registration_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cit_club/constraints/routes.dart';

//the run function builds the appu
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CIT club app',
        home: MainPage(),
        //declaring the routes to different views
        routes: {
          splashScreen: (context) => AnimationPage(),
          loginView: (context) => const Loginview(),
          registerView: (context) => const Registerview(),
        });
  }
}
