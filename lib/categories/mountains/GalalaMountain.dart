import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class galala extends StatefulWidget {
  const galala({Key? key}) : super(key: key);
  @override
  State<galala> createState() => _galalaState();
}
class _galalaState extends State<galala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/galala.jpg",
        placeName: 'Galala Mountain',
        location: 'Suez Government',
        rate:'(4.3)',
        about: 'Galala Mountain  is a mountain located in Suez Governorate, Egypt, with an elevation of 3,300 ft above sea leve '
            'It contains many species of plants and once had sources of water that have since dried up '
            'Galala Mountain is famous for Galala marble, which is quarried for export and has a colour that varies from creamy to creamy '
            'while there you can try one of the best experiences ever the Galala cable car',
        HowToGetThere:"There is daily bus to suez governorate ,then a bus to the mountain" ,
      ),
      );
  }
}