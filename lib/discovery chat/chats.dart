import 'package:discovery/discovery%20chat/firebase_firestore_service.dart';
import 'package:discovery/discovery%20chat/firebase_provider.dart';
import 'package:discovery/discovery%20chat/user_item.dart';
import 'package:discovery/discovery%20chat/user_search.dart';
import 'package:discovery/features/profile/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/menu.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> with WidgetsBindingObserver{
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
    super.initState();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    switch (state){
      case AppLifecycleState.resumed:
        FirebaseFirestoreService.updateUserData({
          'isOnline' : true,
        });
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        FirebaseFirestoreService.updateUserData({'isOnline': false});
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final userData = [
    UserModel(
      id: "1",
      username: "ahmed",
      email: "test@gmail.com",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/d/d7/Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg",
      isOnline: true,
      lastActive: DateTime.now(),
    ),
    UserModel(
      id: "2",
      username: "nada",
      email: "tets@gmail.com",
      image: "images/avatar2.png",
      isOnline: true,
      lastActive: DateTime.now(),
    ),
    UserModel(
      id: "3",
      username: "haidy",
      email: "maest@gmail.com",
      image: "images/avatar4.png",
      isOnline: true,
      lastActive: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      MaterialPageRoute(builder: (context) => menu()));
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xff3e97bd),
                ),
              ),
            ),
          ),
          centerTitle: true,
          title:
              Text("Discovery Chat",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(31, 80, 100, 1),
                  fontFamily: 'Roboto',),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) =>
                          const UsersSearchScreen())),
                  child: Icon(
                    Icons.search,
                    color: Color(0xff3e97bd),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Consumer<FirebaseProvider>(
                builder: (context, value, child) {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  itemCount: value.users.length,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => value.users[index].id !=
                      FirebaseAuth.instance.currentUser?.uid
                      ? UserItem(user: value.users[index])
                      :  SizedBox(),
                      );
            }),
          ),
        ));
  }
}
