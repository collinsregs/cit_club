import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:google_fonts/google_fonts.dart';

class EventsDatabaseServices extends StatelessWidget {
  EventsDatabaseServices({super.key});
  final List<String> docIds = [];
  final storage = FirebaseStorage.instance;
  final CollectionReference news =
      FirebaseFirestore.instance.collection('events');
  final List<String> imageNames = [
    'assets/images/event1.jpeg',
    'assets/images/event2.jpeg',
    'assets/images/events3.jpeg',
    'assets/images/events4.jpeg',
    'assets/images/events5.jpeg',
    'assets/images/event6.jpeg',
    'assets/images/event7.jpeg',
    'assets/images/event11.jpeg',
    'assets/images/event12.jpeg',
    'assets/images/event13.jpeg',
    'assets/images/event14.jpeg',
    'assets/images/event15.jpeg',
    'assets/images/event16.jpeg',
    'assets/images/event17.jpeg',
    'assets/images/event18.jpeg',
    'assets/images/event8.jpeg',
    'assets/images/event9.jpeg',
    'assets/images/event10.jpeg',
    'assets/images/websummit.jpeg',
    'assets/images/summit.jpg',
    'assets/images/news 12.jpg',
    'assets/images/news 13.jpg',
    'assets/images/news (14).jpg',
    'assets/images/news (15).jpg'
  ];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('events')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              docIds.add(element.reference.id);
            }));
  }

  getEventsTitle(documentID) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.exists) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return Text(
                ' ${data['Title']}',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 20, color: Colors.blueGrey[900]),
              );
            } else {
              return const Text('No Data');
            }
          }

          return const Text('loading..');
        }));
  }

  getEventsDate(documentID) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.exists) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return Text(
                ' ${data['Date']}',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 20, color: Colors.blueGrey[900]),
              );
            } else {
              return const Text('No Data');
            }
          }

          return const Text('loading..');
        }));
  }

  getEventSummarry(documentID) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return Text(' ${data['Summary']}');
          }

          return const Text('loading..');
        }));
  }

  getImage(documentID) {
    return Image.asset(
      documentID,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  getEventSummaryPage(documentId, imageId) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getEventsTitle(documentId),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              imageId,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 150,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
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
                          text: getEventsTitle(documentId).toString(),
                          style: const TextStyle(
                              fontSize: 25, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        getEventsDate(documentId).toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          text: getEventSummarry(documentId).toString(),
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
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          'Book a seat',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDocId(),
      builder: (context, snapshot) => ListView.builder(
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        getEventSummaryPage(docIds[index], imageNames[index]),
                  ),
                );
              },
              child: Card(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    getImage(imageNames[index]),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      color: const Color.fromARGB(190, 187, 222, 251),
                      height: 40,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                              left: 10, child: getEventsTitle(docIds[index])),
                          Positioned(
                              top: 20,
                              left: 10,
                              child: getEventsDate(docIds[index])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: docIds.length,
      ),
    );
  }
}
