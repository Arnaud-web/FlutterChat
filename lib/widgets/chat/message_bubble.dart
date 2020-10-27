import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.userName, this.isMe, {this.key});
  final String message;
  final bool isMe;
  final Key key;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: isMe ? Colors.purple : Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                bottomRight: !isMe ? Radius.circular(0) : Radius.circular(12),
              )),
          width: 140,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe ? Colors.white : Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.white,
                  fontSize: 16,
                ),
                //  isMe ? Theme.of(context).accentTextTheme.headline6 : Theme.of(context).accentTextTheme.headline6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
