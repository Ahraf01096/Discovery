import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discovery/features/profile/data/models/user.dart';
import 'package:discovery/features/home/presintation/views/home.dart';
import 'package:discovery/screens/favourite_screen.dart';
import 'package:discovery/utils/constants.dart';
import 'package:discovery/utils/firebase.dart';
import 'package:discovery/utils/styles.dart';
import 'package:discovery/widgets/custom_button.dart';
import 'package:discovery/widgets/indicators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../discovery chat/chats.dart';
import '../features/splash/splash.dart';
import 'group.dart';
import 'mytrip.dart';

class menu extends StatefulWidget {
  final profileId;
  menu({this.profileId});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  User? user;
  UserModel? users;

  final RoundedLoadingButtonController _loadingController =
      RoundedLoadingButtonController();
  void _success() async {
    Timer(Duration(seconds: 3), () {
      _loadingController.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      width: double.infinity,
      height: 1000,
      child: ListView(
        // Remove padding
        padding: EdgeInsets.only(top: 0),
        children: [
          StreamBuilder(
              stream: usersRef.doc(widget.profileId).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  UserModel user = UserModel.fromJson(
                    snapshot.data!.data() as Map<String, dynamic>,
                  );
                  return UserAccountsDrawerHeader(
                    accountName: Text(
                      user.username!,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                    accountEmail: Text(
                      user.email!,
                      style:
                          TextStyle(fontFamily: 'Roboto', color: Colors.white),
                    ),
                    currentAccountPicture: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: CachedNetworkImageProvider(
                        '${user.photoUrl}',
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/covermenu.jpg')),
                    ),
                  );
                }
                return circularProgress(context);
              }),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Color(0xff205065),
            ),
            title: Text('My Favorites',
                style: TextStyle(
                  color: Color(0xff205065),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.directions_bus_outlined,
              color: Color(0xff205065),
            ),
            title: Text('My Trip',
                style: TextStyle(
                  color: Color(0xff205065),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => mytrip(
                          userId: widget.profileId,
                        )),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.description,
              color: Color(0xff205065),
            ),
            title: Text('Policies',
                style: TextStyle(
                  color: Color(0xff205065),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "You Are Disconnected",
                        style: TextStyle(
                          color: Color(0xff205065),
                          fontSize: 22,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      titlePadding: EdgeInsets.only(left: 20, top: 25),
                      content: Text('Try To Connect Before Continue',
                          style: TextStyle(
                            color: Color(0xff205065),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                      contentPadding: EdgeInsets.only(left: 30, top: 9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 225,
                              height: 49,
                              child: RoundedLoadingButton(
                                valueColor: Colors.white,
                                successColor: Color(0xff3e97bd),
                                curve: Curves.easeInBack,
                                color: Color(0xff3e97bd),
                                controller: _loadingController,
                                onPressed: _success,
                                child: Text(
                                  'Try Again',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      actionsPadding: EdgeInsets.only(top: 20, bottom: 20),
                    );
                  });
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.chat_outlined,
              color: Color(0xff205065),
            ),
            title: Text('Chat',
                style: TextStyle(
                  color: Color(0xff205065),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatsScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.group_rounded,
              color: Color(0xff205065),
            ),
            title: Text('Group',
                style: TextStyle(
                  color: Color(0xff205065),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Logout',
                style: TextStyle(
                  color: Color(0xff205065),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            leading: Icon(
              Icons.exit_to_app,
              color: Color(0xff205065),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      actions: [
                        Column(
                          children: [
                            Container(
                              child: Image(image: AssetImage('images/logout.jpg')),
                              width: 90,
                              height: 90,
                            ),
                            Text(
                              "See You Soon",
                              style: Styles.textStyle20.copyWith(color: Constants.kSecondColor),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  backgroundColor: Colors.transparent,
                                  textColor: Constants.kSecondColor,
                                  text: 'Cancel',
                                  onPressed: () {
                                    Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()));
                                  },
                                  borderside:
                                  BorderSide(color: Constants.kSecondColor),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomButton(
                                  backgroundColor: Constants.kSecondColor,
                                  textColor: Colors.white,
                                  onPressed: () async {
                                    await firebaseAuth.signOut();
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (_) => Splash(),
                                      ),
                                          (route) => false,
                                    );
                                  },
                                  text:  'Confirm Logout',
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                      actionsPadding: EdgeInsets.only(top: 20, bottom: 20),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
