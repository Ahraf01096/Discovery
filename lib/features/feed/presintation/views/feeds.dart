import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discovery/features/home/presintation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:discovery/features/feed/data/models/post.dart';
import 'package:discovery/utils/firebase.dart';
import 'package:discovery/widgets/indicators.dart';
import 'package:discovery/features/profile/presintation/views/widgets/userpost.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/styles.dart';
import '../../../home/presintation/views/widgets/custom_icon_button.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int page = 5;
  bool loadingMore = false;
  ScrollController scrollController = ScrollController();

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
      key: scaffoldKey,
      // appBar: AppBar(
      //   leading:  CustomIconButton(
      //     icon: Icon(
      //       Icons.menu_outlined,
      //       color: Constants.kSecondColor,
      //     ),
      //     onPressed: () => Scaffold.of(context).openDrawer(),
      //   ),
      //   actions: [
      //     CustomIconButton(
      //       icon: Icon(
      //         Icons.menu_outlined,
      //         color: Constants.kSecondColor,
      //       ),
      //       onPressed: () => Scaffold.of(context).openDrawer(),
      //     ),
      //
      //   ],
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     'Discovery',
      //     style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w700),
      //   ),
      //   centerTitle: true,
      // ),
      body: RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,
        onRefresh: () =>
            postRef.orderBy('timestamp', descending: true).limit(page).get(),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomAppBar(),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 0,
                child: FutureBuilder(
                  future: postRef
                      .orderBy('timestamp', descending: true)
                      .limit(page)
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
                          PostModel posts =
                              PostModel.fromJson(docs[index].data());
                          return Container(
                            width: 329,
                            height: 250,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              child: UserPost(post: posts),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return circularProgress(context);
                    } else
                      return Center(
                        child: Text(
                          'No Feeds',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
