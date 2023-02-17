import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      //  Navigates to the next screen after 3 seconds
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NextScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png', width: 100.0, height: 100.0),
            const SizedBox(height: 20.0),
            const Text('My App', style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Screen')),
      body: const Center(child: Text('Welcome to the next screen!')),
    );
  }
}
