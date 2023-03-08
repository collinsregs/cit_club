import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SecondReg extends StatefulWidget {
  const SecondReg({super.key});

  @override
  State<SecondReg> createState() => _SecondRegState();
}

class _SecondRegState extends State<SecondReg> {
  late final TextEditingController email;
  late final TextEditingController password;
  register() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.toString(), password: password.toString());
  }

  @override
  void initState() {
    //creating text controllers
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: email,
          ),
          TextField(
            controller: password,
          ),
          TextButton(onPressed: register, child: Text('register'))
        ],
      ),
    );
  }
}
