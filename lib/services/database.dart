import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseServices extends StatelessWidget {
  DatabaseServices({super.key});
  List<String> docIds = [];
  final storage = FirebaseStorage.instance;

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('example')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              print('thiis is working');
              docIds.add(element.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: getDocId(),
        builder: (context, snapshot) => ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: GetHeadline(documentId: docIds[index]),
                ),
                ListTile(
                  title: GenerateNewsCards(documentId: docIds[index]),
                ),
                ListTile(
                  title: GetImage(documentId: docIds[index]),
                ),
                GetImage(documentId: docIds[index]),
                // ImageGetter(documentId: docIds[index])
              ],
            );
          },
          itemCount: docIds.length,
        ),
      )),
    );
  }
}

// this is supposed to generate news headlines for viewing
class GetHeadline extends StatelessWidget {
  final String documentId;
  GetHeadline({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference news = FirebaseFirestore.instance.collection('example');
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(' ${data['headline']}');
          }
          return Text('loading..');
        }));
  }
}

// this is supposed to generate news articles for viewing
class GenerateNewsCards extends StatelessWidget {
  final String documentId;
  GenerateNewsCards({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference news = FirebaseFirestore.instance.collection('example');
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['article']}');
          }
          return Text('loading..');
        }));
  }
}

//this is to generate image urls for the news cards
class GetImage extends StatelessWidget {
  final String documentId;
  GetImage({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference news = FirebaseFirestore.instance.collection('example');
    return FutureBuilder<DocumentSnapshot>(
        future: news.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return Text('${data['photo']}');
          }
          return Text('loading..');
        }));
  }
}

class ImageGetter extends StatelessWidget {
  final String documentId;
  ImageGetter({required this.documentId});
// Get a reference to the document containing the image URL
  getimage() async {
    // Get a reference to the document containing the image URL
    final DocumentReference<Map<String, dynamic>> docRef =
        FirebaseFirestore.instance.collection('news').doc(documentId);

// Retrieve the image URL from the document
    final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await docRef.get();
    final String imageUrl = docSnapshot.get('photo');

// Load the image using the URL
    final ImageProvider imageProvider = NetworkImage(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Image.memory(getimage());
  }
}
