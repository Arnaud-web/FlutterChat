import 'package:FlutterChat/widgets/chat/messages.dart';
import 'package:FlutterChat/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  // ChatScreen(this.userId);
  // ChatScreen(this.userId);
  //   final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterChat"),
        actions: [
          DropdownButton(
              underline: Container(),
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  child: Container(
                      child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  )),
                  value: 'logout',
                )
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              })
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages(""),
            ),
            NewMessage(""),
          ],
        ),
      ),
      // body: StreamBuilder(
      //   stream: Firestore.instance
      //       .collection("chats/A4SZZpeim3WmOxToh4l4/messages")
      //       .snapshots(),
      //   builder: (context, streamSnapshot) {
      //     if (streamSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     final documents = streamSnapshot.data.documents;
      //     return ListView.builder(
      //         itemCount: documents.length,
      //         itemBuilder: (context, index) => Container(
      //               padding: EdgeInsets.all(3),
      //               child: Text(documents[index]['text']),
      //             ));
      //   },
      // ),

      //test connection

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Firestore.instance
      //         .collection("chats/A4SZZpeim3WmOxToh4l4/messages")
      //         .add(
      //       {'text': 'text add by btn'},
      //     );
      //   },
      // ),
    );
  }
}
