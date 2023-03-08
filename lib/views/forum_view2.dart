import 'package:flutter/material.dart';

class ForumView extends StatefulWidget {
  @override
  _ForumViewState createState() => _ForumViewState();
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
      appBar: AppBar(title: Text('Forum')),
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
