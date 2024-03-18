import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';

class rasshetan extends StatefulWidget {
  const rasshetan({Key? key}) : super(key: key);
  @override
  State<rasshetan> createState() => _rasshetanState();
}
class _rasshetanState extends State<rasshetan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
          image: "images/rasshetan.webp",
          placeName: 'Ras shetan',
          location: 'gulf of aqaba',
          rate:  '(4.5)',
          about: "Camping at Ras Shetan is a chance to meet the virgin nature, "
              "mountain view, sky blue waters and astonishing diving scenery. A shack on the mountain skirts, ",
          HowToGetThere:"it takes around six hours from Cairo, and the trip will not be pricy, especially if you are going to use your own car, or if a group of friends rent a minivan, which would be better than going through one of the transportation companies. If you are going to take a bus, you will get off at "
              "Nuweiba, but make sure to know where you will get off, because it is not an official stop..",

      ),
    );
  }
}