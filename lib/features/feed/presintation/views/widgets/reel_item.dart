import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discovery/features/reels/data/models/reel.dart';
import 'package:discovery/features/profile/data/models/user.dart';
import 'package:discovery/features/profile/presintation/views/profile.dart';
import 'package:discovery/features/profile/presintation/views/widgets/edit_profile.dart';
import 'package:discovery/features/reels/presintation/views/widgets/view_reel.dart';
import 'package:discovery/services/reel_service.dart';
import 'package:discovery/utils/firebase.dart';
import 'package:discovery/utils/styles.dart';
import 'package:discovery/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelItem extends StatefulWidget {
  final ReelModel? reel;
  final profileId;

  ReelItem({this.profileId, this.reel});

  final ReelService services = ReelService();

  final DateTime timestamp = DateTime.now();

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  User? user;
  bool isLoading = false;
  int postCount = 0;
  int followersCount = 0;
  int followingCount = 0;
  bool isFollowing = false;
  UserModel? users;
  final DateTime timestamp = DateTime.now();
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    checkIfFollowing();
    _controller = VideoPlayerController.network(widget.reel!.videoUrl!);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  checkIfFollowing() async {
    DocumentSnapshot doc = await followersRef
        .doc(widget.reel!.ownerId)
        .collection('userFollowers')
        .doc(currentUserId())
        .get();
    setState(() {
      isFollowing = doc.exists;
    });
  }

  late VideoPlayerController _controller;

  late Future<void> _initializeVideoPlayerFuture;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return VideoPlayer(_controller);
              } else {
                return Center(
                  child: CircularProgressIndicator(color: Color(0xff3e97bd)),
                );
              }
            },
          ),
        ),
      ),
      StreamBuilder(
          stream: usersRef.doc(widget.reel!.ownerId!).snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot snap = snapshot.data!;
              UserModel user =
                  UserModel.fromJson(snap.data() as Map<String, dynamic>);
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onTap: () =>
                              showProfile(context, profileId: user.id!),
                          child: Row(
                            children: [
                              user.photoUrl!.isEmpty
                                  ? CircleAvatar(
                                      child: Center(
                                        child: Text(
                                          '${user.username![0].toUpperCase()}',
                                          style: Styles.textStyle16,
                                        ),
                                      ),
                                      radius: 15,
                                    )
                                  : CircleAvatar(
                                      radius: 22.0,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        '${user.photoUrl}',
                                      ),
                                    ),
                              SizedBox(width: 10),
                              Text(
                                '${widget.reel!.username! ?? ""}',
                                style: Styles.textStyle20
                                    .copyWith(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              buildFollowButton(widget.profileId),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          '"${widget.reel!.description! ?? ""}"',
                          style:
                              Styles.textStyle16.copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              '${widget.reel!.location! ?? 'Discovery'}',
                              style: Styles.textStyle16
                                  .copyWith(color: Colors.white),
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ]);
            } else {
              return Container();
            }
          })
    ]);
  }

  showProfile(BuildContext context, {String? profileId}) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => Profile(profileId: profileId),
      ),
    );
  }

  buildFollowButton(user) {
    //if isMe then display "edit profile"
    if (isFollowing) {
      return buildButton(
        text: " Following ",
        function: handleUnfollow,
      );
    } else if (!isFollowing) {
      return buildButton(
        text: " Follow ",
        function: handleFollow,
      );
    }
  }

  buildButton({String? text, Function()? function}) {
    return Center(
        child: CustomButton(
          height: 32,
      backgroundColor: Colors.transparent,
      textColor: Colors.white,
      fontSize: 13,
      text: text!,
      onPressed: function!,
      borderside: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(30),
    ));
  }

  handleUnfollow() async {
    DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
    users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    setState(() {
      isFollowing = false;
    });
    //remove follower
    followersRef
        .doc(widget.reel!.ownerId)
        .collection('userFollowers')
        .doc(currentUserId())
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    //remove following
    followingRef
        .doc(currentUserId())
        .collection('userFollowing')
        .doc(widget.reel!.ownerId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    //remove from notifications feeds
    notificationRef
        .doc(widget.reel!.ownerId)
        .collection('notifications')
        .doc(currentUserId())
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleFollow() async {
    DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
    users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    setState(() {
      isFollowing = true;
    });
    //updates the followers collection of the followed user
    followersRef
        .doc(widget.reel!.ownerId)
        .collection('userFollowers')
        .doc(currentUserId())
        .set({});
    //updates the following collection of the currentUser
    followingRef
        .doc(currentUserId())
        .collection('userFollowing')
        .doc(widget.reel!.ownerId)
        .set({});
    //update the notification feeds
    notificationRef
        .doc(widget.reel!.ownerId)
        .collection('notifications')
        .doc(currentUserId())
        .set({
      "type": "follow",
      "ownerId": widget.reel!.ownerId,
      "username": users?.username,
      "userId": users?.id,
      "userDp": users?.photoUrl,
      "timestamp": timestamp,
    });
  }
}
