import 'dart:typed_data';

import 'package:discovery/discovery%20chat/chat_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_messages.dart';
import 'custom_text_form_field.dart';
import 'firebase_firestore_service.dart';
import 'media_service.dart';
import 'notification_service.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key, required this.receiverId});
  final String receiverId;
  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final controller = TextEditingController();


  Uint8List? file;


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: CustomTextFormField(
        controller: controller,
        hintText: 'Add Message...',

      ),
      ),
      SizedBox(width: 5,),
      CircleAvatar(
        backgroundColor: Color(0xff3e97bd),
        radius: 20,
        child: IconButton(
          icon: Icon(Icons.send,
          color: Colors.white,),
          onPressed: () => _sendText(context),
        ),
      ),
       SizedBox(width: 5),
      CircleAvatar(
        backgroundColor: Color(0xff3e97bd),
        radius: 20,
        child: IconButton(
          icon: const Icon(Icons.camera_alt,
              color: Colors.white),
          onPressed: _sendImage,
        ),
      ),
    ],
  );
  Future<void> _sendText(BuildContext context) async {
    if (controller.text.isNotEmpty) {
      await FirebaseFirestoreService.addTextMessage(
        receiverId: widget.receiverId,
        content: controller.text,
      );
      controller.clear();
      FocusScope.of(context).unfocus();
    }
    FocusScope.of(context).unfocus();
  }
  Future<void> _sendImage() async {
    final pickedImage = await MediaService.pickImage();
    setState(() => file = pickedImage);
    if (file != null) {
      await FirebaseFirestoreService.addImageMessage(
        receiverId: widget.receiverId,
        file: file!,
      );
    }
  }
}
