import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'empty_widget.dart';
import 'firebase_provider.dart';
import 'message.dart';
import 'message_bubble.dart';

class ChatMessages extends StatelessWidget {
  ChatMessages({super.key, required this.receiverId});
  final String receiverId;

  @override
  Widget build(BuildContext context) => Consumer<FirebaseProvider>(
        builder: (context, value, child) => value.message.isEmpty
            ? const Expanded(
                child: EmptyWidget(icon: Icons.waving_hand, text: 'Say Hello!'),
              )
            : Expanded(
                child: ListView.builder(
                  controller:
                      Provider.of<FirebaseProvider>(context, listen: true)
                          .scrollController,
                  itemCount: value.message.length,
                  itemBuilder: (context, index) {
                    final isTextMessage =
                        value.message[index].messageType == MessageType.text;
                    final isMe = receiverId != value.message[index].senderId;

                    return isTextMessage
                        ? MessageBubble(
                            isMe: isMe,
                            message: value.message[index],
                            isImage: false,
                          )
                        : MessageBubble(
                            isMe: isMe,
                            message: value.message[index],
                            isImage: true,
                          );
                  },
                ),
              ),
      );
}
