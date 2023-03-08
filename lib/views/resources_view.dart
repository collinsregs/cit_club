import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResourceView extends StatefulWidget {
  const ResourceView({super.key});

  @override
  State<ResourceView> createState() => _ResourceViewState();
}

class _ResourceViewState extends State<ResourceView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Text(
              'CIT CLUB TRACKS',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'flutter',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ));
  }
}
