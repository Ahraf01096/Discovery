import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class grand extends StatefulWidget {
  const grand({Key? key}) : super(key: key);
  @override
  State<grand> createState() => _grandState();
}
class _grandState extends State<grand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image:"images/mu1.jpg" ,
        placeName:'Grand Egyptian Museum ' ,
        location: 'Giza-Al-Ahram Hill',
        rate: '(4.3)',
        about: "The Grand Egyptian Museum Located next to the Giza Pyramids,  museum in Giza, Egypt, housing archaeological artifacts from thousands of years of human civilization in Egypt, spanning from the predynastic period to the Greco-Roman era (c. 3100 BCE to 400 CE)."
            "Its collection draws from a number of cultural institutions in Egypt, including the Egyptian Museum (founded in 1858) in downtown Cairo. The centrepiece of that museum’s collection is the cache of items discovered in the tomb of King Tutankhamun, and it will have pride of place in the new museum."
            "Occupying a 120-acre (50-hectare) plot of land, the Grand Egyptian Museum (GEM) is the largest archaeological museum in the world",
        HowToGetThere: "Take the line 2 Metro from Martyrs to Cairo University"
            " Take a taxi from Cairo University to Grand Egyptian Museum 15 min ",
      ),
    );
  }
}