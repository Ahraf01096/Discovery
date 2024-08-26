import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discovery/features/feed/data/models/post.dart';
import 'package:discovery/models/trip.dart';
import 'package:discovery/utils/firebase.dart';
import 'package:discovery/widgets/indicators.dart';
import 'package:discovery/widgets/usertrip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'menu.dart';

class mytrip extends StatefulWidget {
  final userId;

  mytrip({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<mytrip> createState() => _mytripState();
}

class _mytripState extends State<mytrip> {
  int page = 5;
  bool loadingMore = false;
  ScrollController scrollController = ScrollController();

  currentUserId() {
    return firebaseAuth.currentUser!.uid;
  }

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          page = page + 5;
          loadingMore = true;
        });
      }
    });
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
                        MaterialPageRoute(builder: (context) => menu()));
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
              Text("My Trip",
                  textAlign: TextAlign.start,
                  style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w500)),
            ],
          )),
      body: RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,
        onRefresh: () =>
            tripsRef.orderBy('rating', descending: false).limit(page).get(),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height - 10,
            child: FutureBuilder(
              future: tripsRef
                  .where('userId', isEqualTo: currentUserId())
                  .get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  var snap = snapshot.data;
                  List docs = snap!.docs;
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      PostModel trips =
                          PostModel.fromJson(docs[index].data());
                      return Container(

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                          child: UserTrip(post: trips),
                        ),
                      );
                    },
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return circularProgress(context);
                } else {
                  return Center(
                    child: Center(
                        child: Text(
                      'Your Trips List Is Empty',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(31, 80, 100, 1),
                      ),
                    )),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
