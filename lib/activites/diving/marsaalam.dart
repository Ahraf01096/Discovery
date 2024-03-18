import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class marsaalam extends StatefulWidget {
  const marsaalam({Key? key}) : super(key: key);

  @override
  State<marsaalam> createState() => _marsaalamState();
}

class _marsaalamState extends State<marsaalam> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
          image: "images/diving1.jpg",
          placeName: 'marsa alam',
          location:'red sea governorate' ,
          rate: '(3.8)',
          about: 'Marsa Alam is a more southerly destination in the Red Sea. Expect to encounter dolphins on the way to dive sites by boat and maybe even underwater too.'
              'With fantastic shore and boat diving, Marsa Alam is a favorite among divers in the know. This Red Sea town features some of the best beaches in Egypt ',
          HowToGetThere:'Everyone else can look at flights into Hurghada where which is around a 3 hour drive from Marsa Alam, or look into flights to Cairo and then a domestic flight'
              'Fly to Cairo then take a one hour flight with Egypt Air to Marsa Alam Airport. From Cairo, you can also take a 10 hou',
      ),  );
  }
}