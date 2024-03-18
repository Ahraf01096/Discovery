import 'package:discovery/widgets/placeWidget.dart';
import 'package:flutter/material.dart';
class Agiba extends StatefulWidget {
  const Agiba({Key? key}) : super(key: key);

  @override
  State<Agiba> createState() => _AgibaState();
}
class _AgibaState extends State<Agiba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image: "images/agiba.webp" ,
        placeName: 'Shore of Agiba',
        location: 'mersa matruh' ,
        rate: '(4.1)',
        about: 'Agiba Beach indeed is one of the most beautiful Beaches in Marsa Matrouh. In fact'
            ', the beach located on the Egyptian Mediterranean Sea coast. Moreover, '
            'the beach is about 24km west of Marsa Matruh. It is a small, spectacular cove,'
            ' accessible only via a path leading down from the clifftop.In fact, the water here is a'
            ' dazzling clear turquoise. Moreover, it packed in summer and near empty the'
            ' rest of the year. Note that it isn’t ideal for toddlers, as the waves roll in strongly',
        HowToGetThere: "Cairo to Marsa Matrouh by bus The bus journey time between Cairo and Marsa Matrouh is around 5h and "
            "covers a distance of around 437 km. Operated by Go Bus Egypt and West and Middle delta, the Cairo "
            "to Marsa Matrouh bus service departs from Tahrir and arrives in Marsa Matruh. "
            "Typically seven buses run weekly, although weekend and holiday schedules can vary so check in advance",
      ),
    );
  }
}
