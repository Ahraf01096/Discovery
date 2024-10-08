import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import '../features/profile/data/models/user.dart';
import 'firebase_firestore_service.dart';
import 'message.dart';

class FirebaseProvider extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  List<UserModel> users = [];
  UserModel? user;
  List<Message> message = [];
  List<UserModel> search = [];
  List<UserModel> getAllUsers() {
    FirebaseFirestore.instance
        .collection('users')
        .snapshots(includeMetadataChanges: true)
        .listen((users) {
      this.users =
          users.docs.map((doc) =>
              UserModel.fromJson(doc.data())).toList();
      notifyListeners();
    });
    return users;
  }
  UserModel? getUserById(String userId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots(includeMetadataChanges: true)
        .listen((user) {
      this.user = UserModel.fromJson(user.data()!);
      notifyListeners();
    });
    return user;
  }

  List<Message> getMessages(String receiverId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('chat')
        .doc(receiverId)
        .collection('message')
        .orderBy('sentTime', descending: false)
        .snapshots(includeMetadataChanges: true)
        .listen((message) {
      this.message = message.docs
          .map((doc) => Message.fromJson(doc.data()))
          .toList();
      notifyListeners();

      scrollDown();
    });
    return message;
  }
  void scrollDown() =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(
              scrollController.position.maxScrollExtent);
        }
      });
  Future<void> searchUser(String username) async {
    search =
    await FirebaseFirestoreService.searchUser(username);
    notifyListeners();
  }
}
