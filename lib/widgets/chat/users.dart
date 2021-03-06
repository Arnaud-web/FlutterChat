import 'package:FlutterChat/widgets/chat/users_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return StreamBuilder(
            stream: Firestore.instance
                .collection('users')
                .snapshots(),
            builder: (ctx, chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final chatDocs = chatSnapshot.data.documents;
              return ListView.builder(
                  // reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) {
                    return UsersBubble(chatDocs[index]['username'],chatDocs[index]['image_url'],chatDocs[index]['userId']);
                  });
            });
      },
    );
  }
}
