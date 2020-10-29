import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.userName, this.userImage, this.isMe,
      {this.key});
  final String message;
  final String userImage;
  final bool isMe;
  final Key key;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: isMe ? Colors.purple : Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: isMe ? Radius.circular(16) : Radius.circular(40),
                      topRight:
                          isMe ? Radius.circular(40) : Radius.circular(16),
                      bottomLeft:
                          isMe ? Radius.circular(40) : Radius.circular(0),
                      bottomRight:
                          isMe ? Radius.circular(0) : Radius.circular(30),
                    )),
                // width: 140,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: isMe ? 10 : 0,
                    left: isMe ? 0 : 10,
                  ),
                  child: Text(
                    "$userName \n$message",
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.white,
                      fontSize: 16,
                    ),

                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                    //  isMe ? Theme.of(context).accentTextTheme.headline6 : Theme.of(context).accentTextTheme.headline6,
                  ),
                ),
              ),
            ),
          ],
        ),
        isMe
            ? Positioned(
                top: -5,
                right: 0,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(userImage),
                  ),
                ))
            : Positioned(
                top: -5,
                left: 0,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(userImage),
                  ),
                )),
      ],
      overflow: Overflow.visible,
    );
  }
}
