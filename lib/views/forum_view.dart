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
  List<String> _forumPosts = [
    'First forum post',
    'Second forum post',
    'Third forum post',
  ];

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
      body: ListView.builder(
        itemCount: _forumPosts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Posted by User on 01/01/2022'),
                  SizedBox(height: 8.0),
                  Text(_forumPosts[index], style: TextStyle(fontSize: 18.0)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //  Navigate to the add forum post screen
        },
      ),
    );
  }
}
