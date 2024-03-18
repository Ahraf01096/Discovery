import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class alaqmar extends StatefulWidget {
  const alaqmar({Key? key}) : super(key: key);
  @override
  State<alaqmar> createState() => _alaqmarState();
}
class _alaqmarState extends State<alaqmar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/alaqmar.JPG",
        placeName: 'Al-Aqmar Mosque',
        location: 'Al Moez Street, Cairo',
        rate: '(3.8)',
        about: 'Al-Aqmar mosque is located on al-Muizz Street, and was commissioned by the Fatimid Caliph al-Amir bi-Ahkam Allah in 519 AH/ 1125 AD. The mosque’s construction was supervised by the Vizier al-Ma’mun al-Bata’ihi, and it was renewed during the reign of Sultan Barquq in 799 AH/ 1397 AD under the supervision of Prince Yalbugha al-Salmi'
            'The main façade of the mosque is presently one of the oldest surviving stone façades in Egypt. Its architecture is characterized by its intricate stone carvings and the repetition of the phrase “Muhammad and Ali”, in addition to Qur’anic verses written in the Kufic script. The engineer’s ingenuity is most manifest'
            'in his ability to orient the façade to the direction of the street and maintain the direction of prayer inside the mosque.',
        HowToGetThere: "Aqmar after 10 minutes walking escorted by some of the most interesting Islamic monuments in Egypt",
      ),
     );
  }
}