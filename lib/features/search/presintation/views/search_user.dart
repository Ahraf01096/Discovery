import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discovery/features/search/presintation/views/search_place.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:discovery/features/profile/data/models/user.dart';
import 'package:discovery/features/profile/presintation/views/profile.dart';
import 'package:discovery/utils/constants.dart';
import 'package:discovery/utils/firebase.dart';
import 'package:discovery/widgets/indicators.dart';

import '../../../../screens/navigation_screens.dart';
import '../../../../utils/styles.dart';
import '../../../../widgets/custom_button.dart';

class SearchUser extends StatefulWidget {
  @override
  _SearchUserState createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> with AutomaticKeepAliveClientMixin {
  User? user;
  TextEditingController searchController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> users = [];
  List<DocumentSnapshot> filteredUsers = [];
  bool loading = true;

  currentUserId() {
    return firebaseAuth.currentUser!.uid;
  }

  getUsers() async {
    QuerySnapshot snap = await usersRef.get();
    List<DocumentSnapshot> doc = snap.docs;
    users = doc;
    filteredUsers = doc;
    setState(() {
      loading = false;
    });
  }

  search(String query) {
    if (query == "") {
      filteredUsers = users;
    } else {
      List userSearch = users.where((userSnap) {
        Map user = userSnap.data() as Map<String, dynamic>;
        String userName = user['username'];
        return userName.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredUsers = userSearch as List<DocumentSnapshot<Object?>>;
      });
    }
  }

  removeFromList(index) {
    filteredUsers.removeAt(index);
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade200,
          toolbarHeight: 80,
          elevation: 0.0,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => NavigationScreens()));
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xff3e97bd),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text('Search User',
                  textAlign: TextAlign.start,
                  style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w500)),
              Spacer(),
              CustomButton(backgroundColor: Colors.white, textColor: Constants.kSecondColor, text: 'Place',onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchPlace()));
              },)
            ],
          )),
      body: RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,
        onRefresh: () => getUsers(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: buildSearch(),
            ),
            SizedBox(height: 20,),
            buildUsers(),
          ],
        ),
      ),
    );
  }

  buildSearch() {
    return Center(
      child: Container(
        width: 329,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextFormField(
            style: Styles.textStyle18,
            controller: searchController,
            textAlignVertical: TextAlignVertical.center,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
            ],
            textCapitalization: TextCapitalization.sentences,
            onChanged: (query) {
              search(query);
            },
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    searchController.clear();
                  },
                  child: Icon(
                    Ionicons.close_outline,
                    size: 17.0,
                    color: Constants.kSecondColor,
                  ),
                ),
                hintText: 'Search ..',
                hintStyle: Styles.textStyle16.copyWith(color: Color(0xFF9593a8),),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  buildUsers() {
    if (!loading) {
      if (filteredUsers.isEmpty) {
        return Center(
          child: Text(
            "No User Found",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      } else {
        return Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot doc = filteredUsers[index];
                UserModel user =
                    UserModel.fromJson(doc.data() as Map<String, dynamic>);
                if (doc.id == currentUserId()) {
                  Timer(Duration(milliseconds: 500), () {
                    setState(() {
                      removeFromList(index);
                    });
                  });
                }
                return ListTile(
                  onTap: () => showProfile(context, profileId: user.id!),
                  leading: user.photoUrl!.isEmpty
                      ? CircleAvatar(
                          radius: 22.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Center(
                            child: Text(
                              '${user.username![0].toUpperCase()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 22.0,
                          backgroundImage: CachedNetworkImageProvider(
                            '${user.photoUrl}',
                          ),
                        ),
                  title: Text(
                    user.username??'',
                    style: Styles.textStyle18,
                  ),
                  subtitle: Text(
                    user.email?? '',
                    style: Styles.textStyle14,
                  ),
                );
              },
            ),
          ),
        );
      }
    } else {
      return Center(
        child: circularProgress(context),
      );
    }
  }

  showProfile(BuildContext context, {String? profileId}) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => Profile(profileId: profileId),
      ),
    );
  }

  //get concatenated list of users
  //this will help us query the chat id reference in other
  // to get the correct user id

  String getUser(String user1, String user2) {
    user1 = user1.substring(0, 5);
    user2 = user2.substring(0, 5);
    List<String> list = [user1, user2];
    list.sort();
    var chatId = "${list[0]}-${list[1]}";
    return chatId;
  }

  @override
  bool get wantKeepAlive => true;
}
