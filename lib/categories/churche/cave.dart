import 'package:discovery/widgets/placeWidget.dart';
import 'package:flutter/material.dart';

class Cave extends StatefulWidget {
  const Cave({Key? key}) : super(key: key);
  @override
  State<Cave> createState() => _CaveState();
}

class _CaveState extends State<Cave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image: "images/Cave.jpg",
        placeName: 'Cave Church',
        location: 'mokattam,cairo',
        rate: '(3.8)',
        about: 'The Christian residents of Garbage City (see below) needed a'
            ' place to worship after a fire destroyed their church.  '
            'A cave in the nearby Mokattam cliffs was discovered in the 1970\'s and by the early 1990\'s the hundreds of tons of boulders had been cleared, and now a complex of churches and meeting halls serve the Coptic Christians of Garbage City and beyond. They dedicated'
            ' their new-found church to St. Simon the Tanner who lived'
            ' in the 10th century, thus becoming the Monastery of St. Simon. ',
        HowToGetThere: "To get to the church you will drive trough Mokattam "
            "village, also know on the internet as Garbage City. The people live of"
            " the recycling of plastics, carton etc ...",
      ),
    );
  }
}
