import 'package:discovery/widgets/placeWidget.dart';
import 'package:flutter/material.dart';
class celestial extends StatefulWidget {
  const celestial({Key? key}) : super(key: key);
  @override
  State<celestial> createState() => _celestialState();
}
class _celestialState extends State<celestial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/Celestial.jpg",
        placeName: 'Celestial Cathedral',
        location: 'Sharm El-Shaikh',
        rate: '(3.8)',
        about: 'The Cathedral is a historical cathedral '
            'that acts as a historical seat for the Pope of Alexandria the head of the Coptic Orthodox Church. St.'
            't is very amazing and one the most beautiful church that I was in in my life. It is compared in style and luxury and painting to France or Rome',
        HowToGetThere:"It is the best way to hire taxi and go by your own and stay more time there with children, there is many places to see and visit."
            "Also 10 minutes walk on the right there is a catholic church. It is also worth to see it.",

      ),
    );
  }
}
