import 'package:cit_club/constraints/routes.dart';
import 'package:cit_club/firebase_options.dart';
import 'package:cit_club/resources/app_drawer.dart';
import 'package:cit_club/resources/news_loader.dart';
import 'package:cit_club/services/database.dart';
import 'package:cit_club/services/news_from_firebase.dart';

import 'package:cit_club/views/home_page.dart';
import 'package:cit_club/views/login_view.dart';
import 'package:cit_club/views/profile_view.dart';
import 'package:cit_club/views/registration_view.dart';
import 'package:cit_club/views/resources_view.dart';
import 'package:cit_club/views/secondRegistaration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      home: DatabaseServices(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(UserCredential);
    initializeFirebase() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print(FirebaseAuth.instance.currentUser);
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const Loginview();
          }
        },
      ),
    );
  }
}
