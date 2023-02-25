import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewsLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ((context, index) {
        return Container(
          height: 250,
          padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Image.asset(
                  'assets/images/news.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Headline',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
              Divider(
                thickness: 1,
                color: Colors.black38,
              )
            ],
          ),
        );
      }),
    );
  }
}
