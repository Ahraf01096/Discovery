import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class thecrust extends StatefulWidget {
  const thecrust({Key? key}) : super(key: key);
  @override
  State<thecrust> createState() => _thecrustState();
}
class _thecrustState extends State<thecrust> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/thecrust.jpg",
        placeName:'The Crust ' ,
        location: 'maadi ,cairo',
        rate: "(4.6)",
        about: 'The first and only women-led AVPN-affiliate pizzeria in Egypt & Africa, serving true artisanal Neapolitan pizza by an AVPN-trained Pizzaiola',
        HowToGetThere: "you can take taxi 20 min (14.6 km) via Ramses and Ezbet Fahmy, El Basatin",
      ),
    );
  }
}