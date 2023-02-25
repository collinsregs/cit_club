// ignore_for_file: prefer_const_constructors

import 'package:cit_club/services/firebase_services.dart';
import 'package:cit_club/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[100],
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.hive,
                    size: 50,
                  ),
                  const Text(
                    'H I V E',
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
            )),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.black,
              ),
              title: Text(
                'Edit your profile',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileView()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileView()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileView()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                'Log out',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.blue[50],
                      title: Text('Sign Out'),
                      content: Text('Are you sure you want to sign out?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Sign Out'),
                          onPressed: () {
                            signOutUser(context);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
