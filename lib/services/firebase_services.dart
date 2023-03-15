import 'package:cit_club/constraints/routes.dart';
import 'package:cit_club/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Future registerUser(String email, String password) async {
//   await FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: email, password: password);
// }

FirebaseAuth auth = FirebaseAuth.instance;
void signOutUser(context) async {
  await auth.signOut();
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Loginview()));
}

// Future signInUser(String email, String password) async {
//   await FirebaseAuth.instance
//       .signInWithEmailAndPassword(email: email, password: password);
// }
