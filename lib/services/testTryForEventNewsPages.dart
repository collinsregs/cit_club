import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TestTry extends StatefulWidget {
  const TestTry({super.key});

  @override
  State<TestTry> createState() => _TestTryState();
}

class _TestTryState extends State<TestTry> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text('event'),
          backgroundColor: Colors.blue[800],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/event1.jpeg',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: 150,
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.blue[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'event name',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'event date',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'events surmary',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Book a seat',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
