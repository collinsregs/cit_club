import 'package:cit_club/views/events_view.dart';
import 'package:cit_club/views/forum_view.dart';
import 'package:cit_club/views/home_page.dart';
import 'package:cit_club/views/login_view.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => BottomNavState();
}

int selectedIndex = 0;
const List<Widget> widgetOptions = <Widget>[
  Text(
    'Home',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  ),
  Text(
    'Forum',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  ),
  Text(
    'Events',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  ),
];

class BottomNavState extends State<BottomNav> {
  // changing index to the selected
  void onItemTaped(int index) {
    setState(
      () {
        selectedIndex = index;
        changePage(index);
      },
    );
  }

//changing page to selected
  void changePage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ForumView()));
        break;
      case 2:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const EventsView()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[50],
      unselectedItemColor: Colors.blueGrey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: 'Forum',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.event,
          ),
          label: 'Events',
        )
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue[900],
      onTap: onItemTaped,
    );
  }
}
