import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(8),
          child: const Text('This Works!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Firebase.initializeApp();
          FirebaseFirestore.instance
              .collection('chats/kmb32kaA11TuJU3bwv3h/messages')
              .snapshots()
              .listen((data) {
            data.docs.forEach((doc) {
              print(doc['text']);
            });
          });
        },
      ),
    );
  }
}
