import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class fayoum extends StatefulWidget {
  const fayoum({Key? key}) : super(key: key);
  @override
  State<fayoum> createState() => _fayoumState();
}
class _fayoumState extends State<fayoum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/fayoum.webp",
        placeName: 'Fayoum Desert',
        location: 'Fayoum Government',
        rate: '(3.8)',
        about: "The Faiyum Oasis (Arabic: واحة الفيوم Waḥet El Fayyum) is a depression or basin in the desert immediately west of the Nile river, 62 miles south of Cairo, Egypt. The extent of the basin area is estimated at between 1,270 km2 (490 mi2) and 1,700 km2 (656 mi2). The basin floor comprises fields watered by a channel of the Nile, the Bahr Yussef, as it drains into a desert hollow to the west of the Nile Valley. The Bahr Yussef veers west through a narrow neck of land north of Ihnasya, between the archaeological sites of El Lahun and Gurob near Hawara; it then branches out, providing agricultural land in the Faiyum basin, draining into the large saltwater Lake Moeris (Birket Qarun).[1] In prehistory it was a freshwater lake, but is today a saltwater lake.[1] It is a source for tilapia and other fish for the local area."
            "Differing from typical oases, whose fertility depends on water obtained from springs, the cultivated land in the Faiyum is formed of Nile mud brought by the Bahr Yussef canal, 24 km (15 miles) in length.[2] Between the beginning of Bahr Yussef at El Lahun to its end at the city of Faiyum, several canals branch off to irrigate the Faiyum Governorate. The drainage water flows into Lake Moeris.",
        HowToGetThere: "Train: Every day, there is a train departing from Cairo at 19:10 and arriving at Fayoum at 21:30. Ticket fare is EGP45. Or, you may take the train from Cairo to Beni Suef and then take a taxi to Fayoum. However, it takes about 1.5 hours by taxi from Beni Suef to Fayoum.",
      ),
     );
  }
}