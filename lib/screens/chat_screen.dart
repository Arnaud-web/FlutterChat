import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(3),
          child: Text("Bonjour"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Firestore.instance.collection("chats/A4SZZpeim3WmOxToh4l4/messages").snapshots().listen((data) {
            print(data.documents[0]['text']);
            print("ok");
           });
        },),
    );
  }
}
