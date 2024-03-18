import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class egypt extends StatefulWidget {
  const egypt({Key? key}) : super(key: key);
  @override
  State<egypt> createState() => _egyptState();
}
class _egyptState extends State<egypt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: 'images/museum.webp',
        placeName:'Museum Of Egypt' ,
        location: 'Tahrir Square, Cairo',
        rate:'(4.1)' ,
        about: "The Egyptian Museum in Cairo houses the largest collection of Egyptian antiquities in the world. It houses over 120,000 items, with a representative amount on display. Located in a building built in 1901, it is the largest museum in Africa."
            "Among its masterpieces are Pharaoh Tutankhamun's treasure, including its iconic gold burial mask, widely considered one of the best-known works of art in the world and a prominent symbol of ancient Egypt."
            "it's one of the most famous and amazing museums in the world, the Egyptian Museum. It is one of the world's most important museums of ancient history."
            "Travelers will be able to see the amazing treasure of the king Tut, the Mummies, jewelries, statues, eating bowls and toys of ancient Egyptian kings."
            "The Egyptian Museum of Antiquities contains many important pieces of ancient Egyptian history. It houses the world's largest collection of Pharaonic antiquities."
            "The Egyptian government established the museum built in 1835 near the Ezbekieh Garden and later moved to the Cairo Citadel. In 1855, Archduke Maximilian of Austria was given all of the artifacts by the Egyptian government; these are now in the Kunsthistorisches Museum, Vienna.",
        HowToGetThere: "You can go by metro from any station to Sadat station"
            "or by bus to tahrir square",
      ),
    );
  }
}