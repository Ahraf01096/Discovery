import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class mohamedali extends StatefulWidget {
  const mohamedali({Key? key}) : super(key: key);
  @override
  State<mohamedali> createState() => _mohamedaliState();
}
class _mohamedaliState extends State<mohamedali> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/mohamed.jpg",
        placeName: 'Mohamed Ali Mosque',
        location: 'Cairo',
        rate: '(4.7)',
        about: 'The Great Mosque of Muhammad Ali Pasha or Alabaster Mosque (Arabic: مسجد محمد علي; Turkish: Mehmet Ali Paşa Camii) is a mosque situated in the Citadel of Cairo in Egypt and was commissioned by Muhammad Ali Pasha between 1830 and 1848.'
            'Situated on the summit of the citadel, this Ottoman mosque, the largest to be built in the first half of the 19th century, is, with its animated silhouette and twin minarets, the most visible mosque in Cairo.'
            'The mosque was built in memory of Tusun Pasha, Muhammad Ali\'s eldest son, who died in 1816 This mosque, along with the nearby Cairo Citadel, are one of the landmarks and tourist attractions of Cairo ',
        HowToGetThere: "There is no direct connection from Cairo Tower to Mosque of Muhammad Ali. However, you can take the walk to Gezira, take the line 2 Metro to Nageeb, "
            "then take the taxi to Mosque of Muhammad Ali. Alternatively, you can take the taxi to Mosque of Muhammad Ali.",

      ),
      );
  }
}