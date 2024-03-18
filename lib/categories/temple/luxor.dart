import '../../widgets/placeWidget.dart';
import 'package:flutter/material.dart';
class luxor extends StatefulWidget {
  const luxor({Key? key}) : super(key: key);
  @override
  State<luxor> createState() => _luxorState();
}
class _luxorState extends State<luxor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/luxor.webp",
        placeName: 'Luxor Temple',
        location: 'Luxor',
        rate:  '(3.8)',
        about: 'The Luxor Temple (Arabic: معبد الأقصر) is a large Ancient Egyptian temple complex located on '
            'the east bank of the Nile River in the city today known as Luxor (ancient Thebes) and was '
            'constructed approximately 1400 BCE. In the Egyptian language it was known as ipet resyt, '
            '"the southern sanctuary". It was one of the two primary temples on the east bank, the other being Karnak.'
            ' Unlike the other temples in Thebes, Luxor temple is not dedicated to a cult god or a deified version of the pharaoh in '
            'death. Instead, Luxor temple is dedicated to the rejuvenation of kingship; it may have been where many of the pharaohs '
            'of Egypt were crowned in reality or conceptually (as in the case of Alexander the '
            'Great, who claimed he was crowned at Luxor but may never have traveled south of Memphis, near modern Cairo).',
        HowToGetThere: "Cairo is 504 km (314 miles) from Luxor. The road distance is 614.4 km (614.4 miles). "
            "Options for getting to Luxor from Cairo include plane, bus, night train",
      ),
    );
  }
}