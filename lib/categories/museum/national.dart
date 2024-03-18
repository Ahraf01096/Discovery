import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
import 'museum.dart';
class national extends StatefulWidget {
  const national({Key? key}) : super(key: key);
  @override
  State<national> createState() => _nationalState();
}
class _nationalState extends State<national> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image:'images/national.jpg' ,
        placeName: 'National Musuem',
        location: 'Fustat, Cairo',
        rate: '(3.8)',
        about: "The NMEC is the first of its kind in Egypt and the Arab world. It presents the full range of the richness and diversity of Egyptian civilization throughout the ages, from prehistoric times to the present day by focusing on its continuity and stability as demonstrated by its tangible and intangible heritage. The museum’s exceptional collection includes the royal mummies, which are exhibited in a new interactive display using 21st century cutting-edge technology to go beneath the wrappings and reveal their secrets,"
            " in addition to shedding light on the rituals and religious beliefs surrounding mummification in ancient Egypt",
        HowToGetThere: "You can go by metro from any station to Sadat station"
            "or by bus to Fustat square",
      ),
       );
  }
}