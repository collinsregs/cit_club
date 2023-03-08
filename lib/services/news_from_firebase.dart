import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:typed_data';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('news').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print('loading-ish');
            return Center(child: CircularProgressIndicator());
          } else {
            print('snapshot has data');
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var document = snapshot.data!.docs[index];
                return FutureBuilder<Uint8List>(
                  future: getImage(document['photo']),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print('so imefika hapa');
                      return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(snapshot.data!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    document['headline'],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    document['article'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print('snapshot has error');
                      return Text('Error: ${snapshot.error}');
                    } else {
                      print('well ata sijui');
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<Uint8List> getImage(String path) async {
    print(path);
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(path);
    final int maxSize = 5 * 1024 * 1024; // 5MB
    Uint8List data = (await ref.getData(maxSize))!
        .buffer
        .asUint8List(); // Retrieve image data
    return data;
  }
}
