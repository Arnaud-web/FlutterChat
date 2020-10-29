import 'package:FlutterChat/widgets/chat/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  Messages(this.userId);
  final String userId;
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
                .collection('chat')
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder: (ctx, chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final chatDocs = chatSnapshot.data.documents;
              return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) {
                    var _userIdDest = userId+futureSnapshot.data.uid;
                    var _userIdDest1 = futureSnapshot.data.uid+userId;
                    if ( chatDocs[index]['userIdDest']==_userIdDest || chatDocs[index]['userIdDest']==_userIdDest1  ) {
                      return MessageBubble(
                        chatDocs[index]['text'],
                        chatDocs[index]['username'],
                        chatDocs[index]['userImage'],
                        chatDocs[index]['userId'] == futureSnapshot.data.uid,
                        key: ValueKey(chatDocs[index].documentID),
                      );  
                    }
                    return Text("");
                    });
            });
      },
    );
  }
}
