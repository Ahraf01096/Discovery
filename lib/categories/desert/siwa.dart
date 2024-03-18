import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class siwa extends StatefulWidget {
  const siwa({Key? key}) : super(key: key);
  @override
  State<siwa> createState() => _siwaState();
}
class _siwaState extends State<siwa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/siwa.webp",
        placeName: 'Siwa',
        location: 'Western Desert',
        rate: '(3.8)',
        about: "The Siwa Oasis (Arabic: واحة سيوة, Wāḥat Sīwah, IPA: [ˈwæːħet ˈsiːwæ]) is an urban oasis in Egypt; between the Qattara Depression and the Great Sand Sea in the Western Desert, 50 km (30 mi) east of the Libyan border, and 560 km (348 mi) from the capital.[1][2][3] Its fame primarily from its ancient role as the home to an oracle of Ammon, the ruins of which are a popular tourist attraction which gave the oasis its ancient name Oasis of Amun Ra, a major Egyptian deity.[4]",
        HowToGetThere: "West and Middle delta operates a bus from Cairo to Siwa Oasis once daily. Tickets cost 60LE and the journey takes 12h. Train operators. Egyptian Railways.",
      ),
    );
  }
}
