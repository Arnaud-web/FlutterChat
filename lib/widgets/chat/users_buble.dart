import 'package:FlutterChat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class UsersBubble extends StatelessWidget {
  UsersBubble(this.username, this.userUrl);
  final String username;
  final String userUrl;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print(username);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userUrl),
                ),
              ),
              Text(
                username,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
