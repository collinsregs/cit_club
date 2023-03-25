import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:google_fonts/google_fonts.dart';

class NewsDatabaseServices extends StatelessWidget {
  NewsDatabaseServices({super.key});
  final List<String> docIds = [];
  final storage = FirebaseStorage.instance;
  final CollectionReference news =
      FirebaseFirestore.instance.collection('news');
  final List<String> imageNames = [
    'assets/images/news 5.jpg',
    'assets/images/news 1.jpg',
    'assets/images/news 2.jpg',
    'assets/images/news 3.jpg',
    'assets/images/news 4.jpg',
    'assets/images/news 6.jpg',
    'assets/images/news 7.jpg',
    'assets/images/news 11.jpg',
    'assets/images/news 12.jpg',
    'assets/images/news 13.jpg',
    'assets/images/news (14).jpg',
    'assets/images/news (15).jpg'
  ];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('news')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              docIds.add(element.reference.id);
            }));
  }

  getNewsHeadlines(documentID) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.exists) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return Text(
                ' ${data['Headline']}',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 20, color: Colors.blueGrey[900]),
              );
            } else {
              return Text('No Data');
            }
          }

          return const Text('loading..');
        }));
  }

  getNewsArticles(documentID) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return Text(' ${data['Article']}');
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDocId(),
      builder: (context, snapshot) => ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 187, 222, 251),
            child: GestureDetector(
              child: Column(children: [
                getImage(imageNames[index]),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color.fromARGB(190, 187, 222, 251),
                  child: Center(
                    child: getNewsHeadlines(docIds[index]),
                  ),
                )
              ]),
            ),
          );
        },
        itemCount: docIds.length,
      ),
    );
  }
}
