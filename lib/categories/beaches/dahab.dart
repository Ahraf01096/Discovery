import 'package:discovery/widgets/placeWidget.dart';
import 'package:flutter/material.dart';
class Dahab extends StatefulWidget {
  const Dahab({Key? key}) : super(key: key);
  @override
  State<Dahab> createState() => _DahabState();
}
class _DahabState extends State<Dahab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/dahab.webp",
        placeName: 'Dahab',
        location: 'south sinai',
        rate: '(3.9)',
        about: "Dahab is a town in Egypt, located some 85 km (53 miles) north of Sharm el-Sheikh on the Gulf of Aqaba"
            " and 175 km south from Taba, near the southern tip of Sinai."
            " It is a place that many have fallen in love with over the years, "
            "and return to time & time again."
            "Dahab supports a wealth of scuba and snorkeling operators that lead tours to sites from underwater canyons to the notorious Blue Hole."
            "you can have excellent diving with professional and friendly instructors with Amazing & professional open water dive program."
            "a tunnel so deep underwater that it’s only safely accessible by technical divers. But it also offers charming snorkeling and advanced wall dives with a spectacular entrance via a narrow crack called the Bells. ",
        HowToGetThere: "Cairo to Dahab by Bus The cheapest way to get from Cairo to Dahab is to take the bus. Fortunately, there are direct buses to Dahab from Cairo that operate a few times per day, some of which run overnight. "
            "Cost: The cost of a bus from Cairo to Dahab will typically be between 25 USD "
            "Cairo to Dahab by Plane "
            "By far the fastest way to get to Dahab from Cairo is to fly."
            " From Sharm el-Sheikh you can then take a taxi or a bus to arrive in Dahab.",
      ),
    );
  }
}
