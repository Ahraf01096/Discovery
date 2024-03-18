import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class mountmusa extends StatefulWidget {
  const mountmusa({Key? key}) : super(key: key);
  @override
  State<mountmusa> createState() => _mountmusaState();
}
class _mountmusaState extends State<mountmusa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/musa.webp",
        placeName: 'Mount Musa ',
        location: 'Sinai',
        rate: '(4.2)',
        about: 'is a town in the South Sinai Governorate of Egypt, situated at the foot of the mountain Mount Sinai.'
            ' The city is the site of Saint Catherine\'s Monastery.[2] The city is 1,586 metres '
            '(5,203 ft) above sea level and is 120 kilometres (75 mi) away from Nuweiba.In 1994, '
            'its population was 4,603 people. The Saint Catherine area is a UNESCO world heritage site, '
            'officially declared as such in 2002.',
        HowToGetThere: "There is a daily bus service from Cairo to mount musa. The bus leaves from Cairo each morning at 11 AM. It arrives in St Catherine’s the same day at 6 PM. From St. Catherine’s the bus leaves at 6 AM, arriving in Cairo at approximately 1 PM From Cairo, it is advisable to buy your ticket a day in advance and arrive at the terminal 1 hour prior on the day of departure. "
        "Tickets may not be purchased in advance if traveling in the other direction from St Catherine’s to Cairo.",
      ),
    );
  }
}