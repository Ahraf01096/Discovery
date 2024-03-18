import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'chat_messages.dart';
import 'message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.isMe,
    required this.isImage,
    required this.message,
  });

  final bool isMe;
  final bool isImage;
  final Message message;

  @override
  Widget build(BuildContext context) => Align(
    alignment:
    isMe ? Alignment.topRight : Alignment.topLeft,
    child: Container(
      decoration: BoxDecoration(
        color: isMe ? Color(0xff3e97bd) : Colors.grey.shade500,
        borderRadius: isMe
            ? const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          topLeft: Radius.circular(30),
        )
            : const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      margin: const EdgeInsets.only(
          top: 10, right: 10, left: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          isImage
              ? Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(15),
              image: DecorationImage(
                image:
                NetworkImage(message.content),
                fit: BoxFit.cover,
              ),
            ),
          )
              : Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(message.content,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,

                    fontSize: 15,
                    color: Colors.white)),
              ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(decoration: BoxDecoration( borderRadius: BorderRadius.circular(7),color: Colors.white12),
              child: Text(
                timeago.format(message.sentTime),
                style: const TextStyle(
                  color: Colors.white70,

                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
