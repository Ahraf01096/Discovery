import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class charlies extends StatefulWidget {
  const charlies({Key? key}) : super(key: key);
  @override
  State<charlies> createState() => _charliesState();
}
class _charliesState extends State<charlies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image:"images/charlies.jpg" ,
        placeName:'Charlie’s' ,
        location: 'El korba ,cairo',
        rate:"(4.5)" ,
        about: 'Inspired by the Heliopolis of the mid 1900s; a place to make time for making time”',
        HowToGetThere:"you can take taxi 18 min (11.7 km) via Ramses and El-Khalifa El-Maamoun",
      ),
    );
  }
}