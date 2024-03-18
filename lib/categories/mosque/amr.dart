import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';

class amr extends StatefulWidget {
  const amr({Key? key}) : super(key: key);
  @override
  State<amr> createState() => _amrState();
}

class _amrState extends State<amr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image: "images/amr.JPG",
        placeName: 'Amr Ibn Al-Aas Mosque',
        location: 'Cairo',
        rate: '(4.2)',
        about:
            "The mosque of ‘Amr ibn al-‘As is the oldest surviving mosque in Egypt and Africa. General ʿAmr ibn al-ʿAs was one of"
            " the first companions of the Prophet Muhammad. After conquering Egypt in 20 AH/640 AD, he founded its first Islamic capital, Fustat, which falls within the modern city of Cairo. A year later, by order of the Caliph ‘Umar ibn al-Khattab, he also founded the eponymous mosque of ‘Amr ibn al-‘As, which thus became the new capital’s very first building."
            "During the early years following the conquest, the mosque served as a place of gathering for Muslim community and ‘Amr’s troops, which at the time remained a minority in Egypt. Several of the Prophet’s companions assisted in the building’s construction, including al-Zubayr ibn al-‘Awam and Ubada ibn al-Samit",
        HowToGetThere:
            "You Can Take Taxi 12 min (5.1 km) via Cairo very fast with amazing way",
      ),
    );
  }
}
