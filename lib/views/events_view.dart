import 'package:cit_club/resources/app_drawer.dart';
import 'package:cit_club/resources/bottom_nav.dart';
import 'package:cit_club/services/events_database.dart';
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
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('E V E N T S'),
        backgroundColor: Colors.blue[800],
      ),
      endDrawer: MyAppDrawer(),
      body: EventsDatabaseServices(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
