import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class magiclake extends StatefulWidget {
  const magiclake({Key? key}) : super(key: key);

  @override
  State<magiclake> createState() => _magiclakeState();
}
class _magiclakeState extends State<magiclake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
          image:"images/magiccmap.jpg" ,
          placeName: 'agic lake',
          location: 'fayoum',
          rate: '(4.2)',
          about: "The Magic Lake is a beautiful lake located in Wadi El Hitan in Fayoum. It was named the Magic lake as it changes its colours several times a day depending on the time of year "
              "and the amount of sunlight it receives. It is an amazingly beautiful place surrounded by desert. ",
          HowToGetThere:"Train: Every day, there is a train departing from Cairo at 19:10 and arriving at Fayoum at 21:30. Ticket fare is EGP45. Or, you may take the train from Cairo to Beni Suef and then take a taxi to Fayoum. However, it takes about 1.5 hours by taxi from Beni Suef to Fayoum.",
      ),
    );
  }
}