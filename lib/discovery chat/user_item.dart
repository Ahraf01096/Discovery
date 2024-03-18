import 'package:discovery/discovery%20chat/chat_screen.dart';
import 'package:discovery/models/user.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserItem extends StatefulWidget {
  const UserItem({super.key , required this.user});

  final UserModel user;
  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ChatScreen(userId:widget.user.id!,))
      );
    },
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.bottomRight,
        children:[
          CircleAvatar(
          radius: 30,
          backgroundImage:
          NetworkImage(widget.user.photoUrl!),
        ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 10,),
          //   child: CircleAvatar(
          //     backgroundColor: widget.user.isOnline!
          //         ? Colors.green
          //         : Colors.grey,
          //     radius: 6,
          //   ),
          // )
        ],
      ),
      title: Text(
        widget.user.username!,
            style: const TextStyle(
              fontFamily: 'Roboto',
          color: Color(0xff205065),
              fontSize: 17,
              fontWeight: FontWeight.w500
      ),
      ),
    ),
  );
}
