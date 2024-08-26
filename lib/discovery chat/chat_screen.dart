import 'package:discovery/features/profile/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_text_field.dart';
import 'chats.dart';
import 'chat_messages.dart';
import 'firebase_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});

  final String userId;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    Provider.of<FirebaseProvider>(context, listen: false)
      ..getUserById(widget.userId)
      ..getMessages(widget.userId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ChatMessages(receiverId: widget.userId),
            ChatTextField(receiverId: widget.userId)
          ],
        ),
      ),
    );
  }
  AppBar _buildAppBar() => AppBar(
    elevation: 0,

    backgroundColor: Colors.grey.shade200,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => ChatsScreen()));
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xff3e97bd),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Consumer<FirebaseProvider>(
          builder:  (context, value, child) =>
          value.user != null
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(value.user!.photoUrl!),
                radius: 20,
              ),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value.user!.username!,
                      style: TextStyle(
                          color: Color(0xff205065),
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 1),
                    //   child: Text(value.user!.isOnline!
                    //       ? 'Online'
                    //       : 'Offline',
                    //     style: TextStyle(
                    //         color: value.user!.isOnline!
                    //             ? Colors.green
                    //             :Colors.grey,
                    //         fontSize: 14
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          )
              : SizedBox(),
        ),
      ]
    ),
  );
}
