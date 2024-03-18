import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class pasta extends StatefulWidget {
  const pasta({Key? key}) : super(key: key);
  @override
  State<pasta> createState() => _pastaState();
}
class _pastaState extends State<pasta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:PlaceWidget(
        image: "images/os.webp",
        placeName: 'O’s Pasta',
        location: 'Suez Government',
        rate: "(4.8)",
        about: 'O\'s Pasta in Zamalek, Cairo has been serving fabulously delicious creations '
            'in a cozy original atmosphere at the historic Baehler\'s Mansions since 2015.',
        HowToGetThere: "There are 3 ways to get from Cairo Airport (CAI) to Zamalek by bus, taxi or car ; Take the bus from Cairo Airport to Ramses Station. 1h 6m. \$1 ",
      ),
    );
  }
}