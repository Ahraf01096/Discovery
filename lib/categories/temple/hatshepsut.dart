import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class hatshepsut extends StatefulWidget {
  const hatshepsut({Key? key}) : super(key: key);

  @override
  State<hatshepsut> createState() => _hatshepsutState();
}
class _hatshepsutState extends State<hatshepsut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/Hatshepsut .webp",
        placeName: 'Hatshepsut Temple',
        location: 'Luxor',
        rate:   '(3.8)',
        about:'The mortuary temple of Hatshepsut (Egyptian: Ḏsr-ḏsrw meaning "Holy of Holies") is a mortuary temple built '
            'during the reign of Pharaoh Hatshepsut of the Eighteenth Dynasty of Egypt.[b] Located opposite the city of Luxor,'
            ' it is considered to be a masterpiece of ancient architecture.[c] Its three massive terraces rise above the desert floor '
            'and into the cliffs of Deir el-Bahari. Her tomb, KV20, lies inside the same massif capped by El Qurn, a pyramid for her'
            ' mortuary complex. At the edge of the desert, 1 km (0.62 mi) east, connected to the complex by a causeway lies the accompanying'
            ' valley temple. Across the river Nile, the whole structure points towards the monumental Eighth Pylon, ',
        HowToGetThere: "There are 5 ways to get from Cairo to Mortuary Temple of"
            " Hatshepsut by train, plane, bus, taxi or car ; Fly from Cairo (CAI) to Luxor (LXR).",
      ),
    );
  }
}