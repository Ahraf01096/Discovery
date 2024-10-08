import 'package:animations/animations.dart';
import 'package:discovery/features/home/presintation/views/home.dart';
import 'package:discovery/features/reels/presintation/views/reels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:discovery/components/fab_container.dart';
import 'package:discovery/features/profile/presintation/views/profile.dart';
import 'package:discovery/features/feed/presintation/views/feeds.dart';
import 'package:discovery/utils/firebase.dart';

class NavigationScreens extends StatefulWidget {

  @override
  _NavigationScreensState createState() => _NavigationScreensState();
}

class _NavigationScreensState extends State<NavigationScreens> {
  int _page = 0;

  List pages = [
    {
      'title': 'Home',
      'icon': CupertinoIcons.home,
      'page': HomeScreen(),
      'index': 0,
    },
    {
      'title': 'Reels',
      'icon': Ionicons.videocam_outline,
      'page': Reels(profileId: firebaseAuth.currentUser!.uid),
      'index': 1,
    },
    {
      'title': 'Add',
      'icon': Ionicons.add_circle,
      'page': Text(''),
      'index': 2,
    },
    {
      'title': 'Feed',
      'icon': CupertinoIcons.photo_camera,
      'page': Feeds(),
      'index': 3,
    },
    {
      'title': 'Profile',
      'icon': CupertinoIcons.person,
      'page': Profile(profileId: firebaseAuth.currentUser!.uid),
      'index': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: pages[_page]['page'],
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 5),
            for (Map item in pages)
              item['index'] == 2
                  ? buildFab()
                  : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: IconButton(
                  icon: Icon(
                    item['icon'],
                    color: item['index'] != _page
                        ? Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Color(0xFF9593a8)
                        : Color(0xff3e97bd),
                    size: 25.0,
                  ),
                  onPressed: () => navigationTapped(item['index']),
                ),
              ),
            SizedBox(width: 5),
          ],
        ),
      )
    );
  }

  buildFab() {
    return Container(
      height: 45.0,
      width: 45.0,
      // ignore: missing_required_param
      child: FabContainer(
        icon: Ionicons.add_outline,
        mini: true,
      ),
    );
  }

  void navigationTapped(int page) {
    setState(() {
      _page = page;
    });
  }
}