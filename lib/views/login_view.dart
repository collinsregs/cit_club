// ignore_for_file: prefer_const_constructors

import 'package:cit_club/views/home_page.dart';
import 'package:cit_club/views/registration_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => LoginviewState();
}

class LoginviewState extends State<Loginview> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  String errorMessage = '';

  secondSignIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      final User? user = FirebaseAuth.instance.currentUser;

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    //textfield controllers
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    //clearing controllers from memory
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.hive,
                size: 100,
              ),
              //hello there
              Text('Log In', style: GoogleFonts.bebasNeue(fontSize: 54)),
              SizedBox(
                height: 25,
              ),
              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
                    ),
                  ),
                ),
              ),
              //password textfield
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'password'),
                    ),
                  ),
                ),
              ),
              Text(errorMessage),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: secondSignIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => Registerview())),
                    child: Text(
                      ' Register now',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              //signin button
              //register button
            ],
          ),
        ),
      ),
    );
  }
}
