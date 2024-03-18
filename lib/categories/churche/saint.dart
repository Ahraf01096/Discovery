import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class saint extends StatefulWidget {
  const saint({Key? key}) : super(key: key);
  @override
  State<saint> createState() => _saintState();
}
class _saintState extends State<saint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/Saint.jpg",
        placeName: 'Saint Gerges Church',
        location: 'Cairo',
        rate: '(3.8)',
        about: 'The Church of St. George (Greek: Εκκλησία Αγίου Γεωργίου; Arabic: كنيسة القديس جورج) is a Greek Orthodox church within the Babylon Fortress in Coptic Cairo.[1][2] It is part of the Holy Patriarchal Monastery of St George under the Greek Orthodox Patriarchate of Alexandria and all Africa.[1] The church dates back to the 10th century (or earlier). The current structure was rebuilt following a 1904 fire,[3] construction was finished in 1909.'
            ' Since 2009, the monastery\'s hegumen has had the rank of bishop with title Bishop Babylonos ("Bishop of Babylon")',
        HowToGetThere: "Located about 30 minutes from Downtown Cairo, "
            "Saint Georges Church sits in the heart of Old Coptic Cairo in the Old Cairo district",
      ),
    );
  }
}