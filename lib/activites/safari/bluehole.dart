import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';

class bluehole extends StatefulWidget {
  const bluehole({Key? key}) : super(key: key);

  @override
  State<bluehole> createState() => _blueholeState();
}
class _blueholeState extends State<bluehole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image: "images/safari3.jpg",
        placeName: 'Blue Hole',
        location: 'red sea governorate',
        rate: '(3.8)',
        about: 'The Blue hole attracts experienced divers and curious people from all over the world. Famous for freediving for its easy access directly from the shore and the lack of current, the Blue Hole is known to have the highest diving fatalities in the world with an estimated death of 130 to 200 divers in recent years',
        HowToGetThere: 'Egypt Ancient Trail Adventure · \$3,950.00 ; Ras Abu Gallum and Blue Hole Overnight Snorkeling trip From Dahab. Full-day Tours ·'
            '\$90.00 ; Blue Hole National Park',
      ),
    );
  }
}