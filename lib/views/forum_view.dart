import 'package:cit_club/resources/app_drawer.dart';
import 'package:cit_club/resources/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForumView extends StatefulWidget {
  const ForumView({super.key});

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('F O R U M'),
        backgroundColor: Colors.blue[800],
      ),
      endDrawer: MyAppDrawer(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
