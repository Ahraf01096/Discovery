import 'package:discovery/widgets/placeWidget.dart';
import 'package:flutter/material.dart';
class NorthCoast extends StatefulWidget {
  const NorthCoast({Key? key}) : super(key: key);

  @override
  State<NorthCoast> createState() => _NorthCoastState();
}
class _NorthCoastState extends State<NorthCoast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image:"images/north.webp" ,
        placeName: 'north coast',
        location: "north coast",
        rate: '(4.3)',
        about: 'The Northern Coast of Egypt, extends for about 1,050 km (650 mi) along '
            'the Mediterranean Sea, it covers entirely the northern territory of Egypt. It is '
            'one of the longest Mediterranean coastlines in North Africa. Famous for its '
            'pristine beaches and nightlife venues, the North Coast is one of the most popular summer destinations in Egypt. '
            'North Coast stretches from Alexandria to Marsa Matrouh covering an area of 500 SQ KM. The Northcoast is famous for'
            ' its array of entertainment venues',
        HowToGetThere: "Cairo to North Coast Egypt The North Coast has an endless array of resorts and coastal destinations spread across different areas including; Ras El Hekma, Al Dabaa, El Alamein, Sidi Abdel Rahman, Fouka, and Sidi Heneish. "
            "So if you are going from Cairo to North Coast Egypt the first thing you go to do is know your destination. Got it? If it’s in "
            "Sidi Abdel Rahaman, take the International Coastal Road. New Alamein or El Dabaa take the Dabaa Road Ras El Hekma, take the Fouka RoadFouka the take the Fouka Road that’s an easy one "
            "Sidi Henish, take the International Coastal Road "
            "It is also worth noting that the International Coastal Road (Alexandria – Marsa Matrouh Road) and the Dabaa Road can take you anywhere in the North Coast.",
      ),
    );
  }
}