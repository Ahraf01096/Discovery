import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class bahariya extends StatefulWidget {
  const bahariya({Key? key}) : super(key: key);

  @override
  State<bahariya> createState() => _bahariyaState();
}
class _bahariyaState extends State<bahariya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: 'images/baharia.webp',
        placeName: 'Bahariya Oasis',
        location: 'Al Wahat Al Bahariya',
        rate: '(3.8)',
        about: "Bahariya Oasis (Arabic: الواحات البحرية, romanized: El-Wāḥāt El-Baḥrīya, the Northern Oases is a"
            " depression and a naturally rich oasis in the Western Desert of Egypt. It is approximately 370 km away from Cairo. The roughly oval valley extends from northeast to southwest, has a length of 94 km, a maximum width of 42 km and covers an area of about 2000 km²."
            "The valley is surrounded by mountains and has numerous springs. Located in Giza Governorate, the main economic sectors are agriculture, iron ore mining, and tourism. The main agricultural products are guavas, mangos, dates, and olives.",
        HowToGetThere: "Compare all travel options now! Train, bus, ferry, drive and fly. Book tickets. Find how to get anywhere. Compare travel options. Find cheap tickets. Highlights: App Available, Travel Guides Available, We Use Thousands Of Multi-Modal Routes.",
      ),
    );
  }
}