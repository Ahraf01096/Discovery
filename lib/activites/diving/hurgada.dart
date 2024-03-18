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
      body: PlaceWidget(
        image: "images/diving3.jpg",
        placeName: 'Hurghada',
        location: 'red sea governorate',
        rate: '(4.3)',
        about: 'Hurghada offers daily diving as well as being a favourite leaving point for many liveaboards. Liveaboard trips leave from here to explore a greater range of it'
            'Dive Hurghada Scuba Diving, Diving courses, liveaboard and snorkeling in Hurghada. ... Red Sea Diving Trip from Hurghada: Beginner to Advanced Divers',
        HowToGetThere: 'There are 6 ways to get from Sharm El Naga Resort and Diving Center, Hurghada to Cairo by plane, bus, night bus, taxi or car'
            ' ; Recommended option. Fly · 3h 3m',
      ),
    );
  }
}