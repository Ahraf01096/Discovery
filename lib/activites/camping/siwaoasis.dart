import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class siwaasis extends StatefulWidget {
  const siwaasis({Key? key}) : super(key: key);

  @override
  State<siwaasis> createState() => _siwaasisState();
}

class _siwaasisState extends State<siwaasis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
          image: "images/siwacaming.webp",
          placeName: 'Siwa oasis ',
          location: 'western desert',
          rate: '(3.9)',
          about: "The Siwa Oasis (Arabic: واحة سيوة, Wāḥat Sīwah, IPA: [ˈwæːħet ˈsiːwæ]) is an urban oasis in Egypt; between the Qattara Depression and the Great Sand Sea in the Western Desert, 50 km (30 mi) east of the Libyan border, and 560 km (348 mi) from the capital.[1][2][3] Its fame primarily from its ancient role as the home to an oracle of Ammon, the ruins of which are a popular tourist attraction which gave the oasis its ancient name Oasis of Amun Ra, a major Egyptian deity.[4]",
          HowToGetThere:"West and Middle delta operates a bus from Cairo to Siwa Oasis once daily. Tickets cost 60LE and the journey takes 12h. Train operators. Egyptian Railways.",
      ),
    );
  }
}