import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class whiteisland extends StatefulWidget {
  const whiteisland({Key? key}) : super(key: key);

  @override
  State<whiteisland> createState() => _whiteislandState();
}

class _whiteislandState extends State<whiteisland> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
          image: "images/diving2.jpg",
          placeName: 'White Island ',
          location: 'sharm el sheikh',
          rate:  '(3.6)',
          about: 'White Island is one of Egypt \'s most popular Diving and Snorkeling sites,'
              'with a large variety of fish and corals. Once you are aboard the Boat',
          HowToGetThere:'Located 10 km from Sharm El Sheikh, the White Island which is about 45 minutes from Ras Mohamed national protectorate offers you the chance to it',
      ),
    );
  }
}