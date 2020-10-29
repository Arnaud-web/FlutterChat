import 'package:FlutterChat/widgets/chat/chat_user.dart';
import 'package:flutter/material.dart';

class UsersBubble extends StatelessWidget {
  UsersBubble(this.username, this.userUrl, this.userId);
  final String username;
  final String userUrl;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          var data = {'userId': userId, 'username': username};
          print(data['username']);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatUser(userId, username, userUrl)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
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
      ),
    );
  }
}
