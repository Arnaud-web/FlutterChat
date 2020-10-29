import 'package:FlutterChat/widgets/chat/messages.dart';
import 'package:FlutterChat/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatUser extends StatelessWidget {
  ChatUser(this.userIdDest, this.usernameDest,this.url);
  final String userIdDest;
  final String usernameDest;
  final String url;

// ChatUser({this.data}) ;
// var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
            ),
            Text(usernameDest),
          ],
        ),
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
              // child: Messages(data["userIdDest"]),
              child: Messages(userIdDest),

            ),
            // NewMessage(data["userIdDest"]),
            NewMessage(userIdDest),
          ],
        ),
      ),
    );
  }
}
