import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class elgona extends StatefulWidget {
  const elgona({Key? key}) : super(key: key);

  @override
  State<elgona> createState() => _elgonaState();
}
class _elgonaState extends State<elgona> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
          image: "images/safari2.jpg",
          placeName: 'El Gouna ',
          location: 'sharm el sheikh',
          rate:  '(4.6)',
          about: 'One of the biggest safari centers in the Red Sea and South Sinai, Founded in early 2007 to offer to its customers a variety of trips through the Egyptian '
              'El Gounatours offers you Hurghada Super Desert Safari Excursions to enjoy an adventurous experience across the desert.',
          HowToGetThere:'Traveling by plane is the fastest way to get from Cairo to El Gouna. While it\'s often the most expensive option, tool, occasionally you can grab promotional',
      )
    );
  }
}