import 'package:discovery/widgets/placeWidget.dart';
import 'package:flutter/material.dart';
class AlexBeach extends StatefulWidget {
  const AlexBeach({Key? key}) : super(key: key);

  @override
  State<AlexBeach> createState() => _AlexBeachState();
}
class _AlexBeachState extends State<AlexBeach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image: "images/alex.jpg",
        placeName: "Alexandria Beach",
        location: "Alexandria",
        rate: '(3.5)',
        about:'Alexandria is distinguished with its beaches from Al-Ma amora eastern to '
            'Al-Agamy at the west, with about 24 km long, and due to its perfect'
            ' geographic location and its natural resources it became the largest port in the'
            ' Mediterranean and the Middle East, and has acquired popularity among the Arabic countries'
            ' as a good place to stay in during summer (resort) as it contains more than 35 beaches among them touristic beaches, featured beaches, and complimentary beaches along Alexandria sea shores and Al Agamy district, and from the most featured geographic'
            ' monuments in Alexandria is the eastern port with its crescent shape,',
        HowToGetThere:"Cairo to Alexandria by bus The bus journey time between Cairo and"
            " Alexandria is around 3h and covers a distance of around 217 km. Operated by Go Bus Egypt and West and Middle delta "
            "the Cairo to Alexandria bus service departs from Kolaly and arrives in Alexandria Moharam Bek."
            "then take a bus or taxi to 21 Ahmed Yehia Street Zizinia. (Glim)" ,
      ),
        );
  }
}