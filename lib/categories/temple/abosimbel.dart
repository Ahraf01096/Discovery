import '../../widgets/placeWidget.dart';
import 'package:flutter/material.dart';
class abosimbel extends StatefulWidget {
  const abosimbel({Key? key}) : super(key: key);
  @override
  State<abosimbel> createState() => _abosimbelState();
}
class _abosimbelState extends State<abosimbel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/simbel.webp",
        placeName: 'Abu Simbel',
        location: 'Aswan',
        rate: '(4.2)',
        about: 'Abu Simbel is a historic site comprising two massive rock-cut temples in the village of Abu Simbel (Arabic: أبو سمبل), '
            'Aswan Governorate, Upper Egypt, near the border with Sudan. It is situated on the western bank of Lake Nasser, '
            'about 230 km (140 mi) southwest of Aswan (about 300 km (190 mi) by road). The twin temples were originally carved out'
            ' of the mountainside in the 13th century BC, during the 19th Dynasty reign of the Pharaoh Ramesses II. Their huge external'
            ' rock relief figures of Ramesses II have become iconic. His wife, Nefertari, and children can be seen in smaller figures '
            'by his feet. Sculptures inside the Great Temple commemorate Ramesses II\'s'
            ' heroic leadership at the Battle of Kadesh.',
        HowToGetThere: "Flight from Cairo to Abu Simbel (stopping in Aswan) ... "
            "If you're short on time, the quickest and easiest way to get to Abu Simbel is by booking",
      ),
    );
  }
}