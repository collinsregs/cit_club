import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';

class DatabaseServices extends StatelessWidget {
  DatabaseServices({super.key});
  List<String> docIds = [];
  final storage = FirebaseStorage.instance;
  CollectionReference news = FirebaseFirestore.instance.collection('example');

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('example')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              print('ime get refference');
              docIds.add(element.reference.id);
            }));
  }

  getNewsHeadlines(documentID) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print('getting headline is working');

            return Text(
              ' ${data['headline']}',
              style: GoogleFonts.sourceSansPro(fontSize: 25),
            );
          }
          print('getting headline is loading');
          return Text('loading..');
        }));
  }

  getNewsArticles(documentID) {
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print('getting article is working');
            return Text(' ${data['article']}');
          }
          print('getting article is loading');
          return Text('loading..');
        }));
  }

  getImage(documentID) {
    final firebaseStorage = FirebaseStorage.instance.ref;
    // getImageUrl(String? imgName) async {
    //   if (imgName == null) {
    //     return null;
    //   }
    //   try {
    //     print(imgName);
    //     var urlRef = firebaseStorage()
    //         .child('events')
    //         .child('${imgName.toLowerCase()}.png');
    //     var imgUrl = await urlRef.getDownloadURL();
    //     return imgUrl;
    //   } catch (e) {
    //     print(e);
    //     return null;
    //   }
    // }

    geImageNames(documentID) {
      return FutureBuilder<DocumentSnapshot>(
          future: news.doc(documentID).get(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              print('getting image name is working');
              return Text(' ${data['photo']}');
            }
            print('getting image name is loading');
            return Text('');
          }));
    }

    return geImageNames(documentID).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: getDocId(),
        builder: (context, snapshot) => ListView.builder(
          itemBuilder: (context, index) {
            print(getImage(docIds[index]).toString());
            return Card(
              child: GestureDetector(
                child: Stack(alignment: Alignment.bottomLeft, children: [
                  Image.asset(
                    getImage(docIds[index]),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      color: Colors.grey,
                      child: getNewsHeadlines(docIds[index]),
                    ),
                  )
                ]),
              ),
            );
          },
          itemCount: docIds.length,
        ),
      )),
    );
  }
}

// class GetImages extends StatelessWidget {
//   final String documentId;
//   GetImage({required this.documentId});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference news = FirebaseFirestore.instance.collection('example');
//     return FutureBuilder<DocumentSnapshot>(
//         future: news.doc(documentId).get(),
//         builder: ((context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data!.data() as Map<String, dynamic>;

//             return Text('${data['photo']}');
//           }
//           return Text('loading..');
//         }));
//   }
// }

// class ImageGet extends StatelessWidget {
//   // final String documentId;
//   // ImageGet({required this.documentId});
// // Get a reference to the document containing the image URL
//   getimage() async {
//     final storageRef = FirebaseStorage.instance.ref();
//     final imageUrl =
//         await storageRef.child("events/summit.jpg").getDownloadURL();
//     return Image.network(imageUrl);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Image.memory(getimage());
//   }
// }
