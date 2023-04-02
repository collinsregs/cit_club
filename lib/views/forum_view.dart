import 'package:cit_club/resources/app_drawer.dart';
import 'package:cit_club/resources/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForumView extends StatefulWidget {
  ForumView({super.key});

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  List<String> _forumPosts = [
    'First test forum post',
    'Second test forum post',
    'Third test forum post',
  ];
  late final TextEditingController post;
  getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? email;
    if (user != null) {
      email = user.email..toString();
    } else {
      email = 'null';
    }
    String finalString = 'Posted by ${email}';
    return finalString;
  }

  @override
  void initState() {
    //textfield controllers
    post = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    //clearing controllers from memory
    post.dispose();

    super.dispose();
  }

  enterForumPost(context) {
    return () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: AlertDialog(
              backgroundColor: Colors.blue[50],
              title: const Text('Write your post'),
              content: Container(
                width: double.infinity,
                height: 40,
                color: Colors.blue[150],
                child: TextField(
                  controller: post,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Ask Something...'),
                ),
              ),
              actions: <Widget>[
                Center(
                  child: TextButton(
                    child: const Text(
                      'Post',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        _forumPosts.add(post.text);
                      });
                      Navigator.of(context).pop();
                      post.text = '';
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('F O R U M'),
        backgroundColor: Colors.blue[800],
      ),
      endDrawer: MyAppDrawer(),
      bottomNavigationBar: const BottomNav(),
      body: ListView.builder(
        itemCount: _forumPosts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('posted by collinsregs@gmail.com'),
                  const SizedBox(height: 8.0),
                  Text(_forumPosts[index],
                      style: const TextStyle(fontSize: 18.0)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: enterForumPost(context),
      ),
    );
  }
}
