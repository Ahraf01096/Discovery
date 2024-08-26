import 'package:discovery/discovery%20chat/chats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_text_form_field.dart';
import 'empty_widget.dart';
import 'firebase_provider.dart';
import 'user_item.dart';
import '../features/profile/data/models/user.dart';



class UsersSearchScreen extends StatefulWidget {
  const UsersSearchScreen({Key? key}) : super(key: key);

  @override
  State<UsersSearchScreen> createState() =>
      _UsersSearchScreenState();
}

class _UsersSearchScreenState
    extends State<UsersSearchScreen> {
  final controller = TextEditingController();

  final userData = [
    UserModel(
      id: '1',
      username: 'Hazy',
      email: 'test@test.test',
      image: 'https://i.pravatar.cc/150?img=0',
      isOnline: true,
      lastActive: DateTime.now(),
    ),
    UserModel(
      id: '1',
      username: 'Charlotte',
      email: 'test@test.test',
      image: 'https://i.pravatar.cc/150?img=1',
      isOnline: false,
      lastActive: DateTime.now(),
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => ChatsScreen()));
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff3e97bd),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.grey,
      title: const Text(
        'Users Search',
        style: TextStyle(fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(31, 80, 100, 1),
          fontFamily: 'Roboto',),
      ),
    ),
    body: Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        children: [
          CustomTextFormField(
            controller: controller,
            hintText: 'Search',
            onChanged: (val) =>
                Provider.of<FirebaseProvider>(context,
                    listen: false)
                    .searchUser(val),
          ),
          Consumer<FirebaseProvider>(
            builder: (context, value, child) =>
                Expanded(
                  child: controller.text.isEmpty
                      ? const EmptyWidget(
                      icon: Icons.search,
                      text: '')
                      : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    padding: const EdgeInsets.all(16),
                    itemCount: value.search.length,
                    itemBuilder: (context, index) =>
                    value.search[index].id !=
                        FirebaseAuth.instance
                            .currentUser?.uid
                        ? UserItem(
                        user: value
                            .search[index])
                        : const SizedBox(),
                  ),
                ),
          ),
        ],
      ),
    ),
  );
}
