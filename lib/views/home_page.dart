// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cit_club/resources/app_drawer.dart';
import 'package:cit_club/resources/bottom_nav.dart';
import 'package:cit_club/resources/news_loader.dart';
import 'package:cit_club/views/resources_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    print(UserCredential);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('H O M E'),
          backgroundColor: Colors.blue[800],
        ),
        endDrawer: MyAppDrawer(),
        body: Column(
          children: [
            TabBar(tabs: [
              Tab(
                iconMargin: EdgeInsets.only(bottom: 0),
                height: 41,
                icon: Icon(
                  Icons.newspaper,
                  color: Colors.blueGrey,
                ),
                child: Text(
                  'News',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
              Tab(
                iconMargin: EdgeInsets.only(bottom: 0),
                height: 41,
                icon: Icon(
                  Icons.folder_copy,
                  color: Colors.blueGrey,
                ),
                child: Text(
                  'Resources',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ]),
            Expanded(
                child: TabBarView(children: [
              NewsLoader(),
              ResourceView(),
            ]))
          ],
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}
