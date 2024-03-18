import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class hurgada extends StatefulWidget {
  const hurgada({Key? key}) : super(key: key);

  @override
  State<hurgada> createState() => _hurgadaState();
}
class _hurgadaState extends State<hurgada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
          image: "images/safari1.jpg",
          placeName: 'Hurghada ',
          location: 'red sea governorate',
          rate: '(4.3)',
          about: "Hurghada provides more than snorkelin and wonderful marine life, The desert in Hurghada has its secret magic surrounding the city as a natural protection and "
              "excellent golden background with the blue sky all over the year, Hurghada Safari is not only fun for Driving Atvs and Buggies but discovering the secret magic of desert here we provide you with some tours as Private Atvs driving about 3 Hours in the morning and the sunset, Buggy driving more rush and extra fun if you like to do a mix of everything take Super safari which gathering Atvs, Jeep Cars, Spider cars, Beduin Camp and Beduin Lifestyle with Camels Riding includes in all trips, and the Oriental show, all tours are available every day.",
          HowToGetThere:'There are 5 ways to get from Cairo to Hurghada (Station) by train, plane, bus, taxi or car ; Line 3 Metro, fly · Fly from Cairo (CAI) to Hurghada (HRG). 3h 47m',
      ),
      );
  }
}