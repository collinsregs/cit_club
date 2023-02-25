import 'package:cit_club/resources/app_drawer.dart';
import 'package:cit_club/resources/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    var bookmarkIcon = Icons.bookmark_outline;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('E V E N T S'),
        backgroundColor: Colors.blue[800],
      ),
      endDrawer: MyAppDrawer(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Card(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Ink.image(
                    image: AssetImage('assets/images/summit.jpg'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 240,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    color: Color.fromARGB(26, 255, 255, 255),
                    height: 40,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          child: Text(
                            'event title',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Positioned(
                          left: 270,
                          child: Text(
                            'date',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
