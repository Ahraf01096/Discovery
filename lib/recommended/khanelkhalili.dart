import 'package:flutter/material.dart';
import '../widgets/placeWidget.dart';
class khanelkalili extends StatefulWidget {
  const khanelkalili({Key? key}) : super(key: key);
  @override
  State<khanelkalili> createState() => _khanelkaliliState();
}
class _khanelkaliliState extends State<khanelkalili> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
          image: "images/khan.jpg",
          placeName: 'Khan El Khalili',
          location: 'cairo',
          rate: '(4.9)',
          about:  'Khan el-Khalili (Arabic: خان الخليلي) is a famous bazaar and souq (or souk)'
              ' in the historic center of Cairo, Egypt. Established as a center of trade in the Mamluk era and named for one '
              'of its several historic caravanserais, the bazaar district has since become one of Cairo\'s main'
              ' attractions for tourists and Egyptians alike. It is also home to many Egyptian artisans '
              'and workshops involved in the production of traditional crafts and souvenirs. The name Khan el-Khalili historically referred to'
              'single building in the area; today it refers to the entire shopping district.',
          HowToGetThere:"As Khan El Khalili Market is located in the heart of Cairo, it isn't hard to follow one of"
              " the public transportation routes to get there. If you want to save yourself the hassle, order an Uber"
              " or take a taxi. The metro is one of the easiest means, just reach Ataba Station and you're almost there.",
      ),
       );
  }
}