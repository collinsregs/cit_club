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
              return const Text('No Data');
            }
          }

          return const Text('loading..');
        }));
  }

  getNewsHeadlinesFull(documentId) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.exists) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return RichText(
                  text: TextSpan(
                text: ' ${data['Headline']}',
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ));
            } else {
              return const Text('No Data');
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

  getNewsArticlesFull(documentId) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return RichText(
                text: TextSpan(
              text: ' ${data['Article']}',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 20, color: Colors.blueGrey[900]),
            ));
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

  getFulllNewsPage(documentId, imageId, context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: getNewsHeadlines(documentId),
          backgroundColor: Colors.blue[800],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                imageId,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: 150,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.blue[100],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getNewsHeadlinesFull(documentId),
                          const SizedBox(
                            height: 30,
                          ),
                          getNewsArticlesFull(documentId),
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDocId(),
      builder: (context, snapshot) => ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => getFulllNewsPage(
                      docIds[index], imageNames[index], context),
                ),
              );
            },
            child: Card(
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
            ),
          );
        },
        itemCount: docIds.length,
      ),
    );
  }
}
