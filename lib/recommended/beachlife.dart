import 'package:discovery/widgets/placeWidget.dart';
import 'package:flutter/material.dart';
class beachlife extends StatefulWidget {
  const beachlife({Key? key}) : super(key: key);
  @override
  State<beachlife> createState() => _beachlifeState();
}
class _beachlifeState extends State<beachlife> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image: "images/recommended/beach1.jpg",
        placeName: 'Beach Life',
        location: 'south sinai',
        rate: '(4.8)',
        about:   'One of the best-known diving spots on the Red Sea, Beach life is a premium resort town that is part of tourist-central Hurghada',
        HowToGetThere:
        "The best way to get from Cairo to South Sinai Governorate without a car is"
            " to bus via Sharm El-Sheikh which takes 7h 7m and costs \$9 - \$10. How long does it take to get from Cairo to South Sinai Governorate? It takes approximately "
            "3h 35m to get from Cairo to South Sinai Governorate, including transfers.",
      ),
    );
  }
}
