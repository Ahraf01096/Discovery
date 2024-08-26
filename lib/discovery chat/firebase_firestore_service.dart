import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_storge_service.dart';
import 'message.dart';
import 'package:discovery/features/profile/data/models/user.dart';

class FirebaseFirestoreService {
  static final firestore = FirebaseFirestore.instance;

  static Future<void> createUser({
    required String name,
    required String image,
    required String email,
    required String id,
  }) async {
    final user = UserModel(
      id: id,
      email: email,
      username: name,
      image: image,
      isOnline: true,
      lastActive: DateTime.now(),
    );

    await firestore
        .collection('users')
        .doc(id)
        .set(user.toJson());
  }

  static Future<void> addTextMessage({
    required String content,
    required String receiverId,
  }) async {
    final message = Message(
      content: content,
      sentTime: DateTime.now(),
      receiverId: receiverId,
      messageType: MessageType.text,
      senderId: FirebaseAuth.instance.currentUser!.uid,
    );
    await _addMessageToChat(receiverId, message);
  }

  static Future<void> addImageMessage({
    required String receiverId,
    required Uint8List file,
  }) async {
    final image = await FirebaseStorageService.uploadImage(
        file, 'image/chat/${DateTime.now()}');

    final message = Message(
      content: image,
      sentTime: DateTime.now(),
      receiverId: receiverId,
      messageType: MessageType.image,
      senderId: FirebaseAuth.instance.currentUser!.uid,
    );
    await _addMessageToChat(receiverId, message);
  }

  static Future<void> _addMessageToChat(
      String receiverId,
      Message message,
      ) async {
    await firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('chat')
        .doc(receiverId)
        .collection('message')
        .add(message.toJson());

    await firestore
        .collection('users')
        .doc(receiverId)
        .collection('chat')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('message')
        .add(message.toJson());
  }

  static Future<void> updateUserData(
      Map<String, dynamic> data) async =>
      await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(data);

  static Future<List<UserModel>> searchUser(
      String username) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where("username", isGreaterThanOrEqualTo: username)
        .get();

    return snapshot.docs
        .map((doc) => UserModel.fromJson(doc.data()))
        .toList();
  }
}
