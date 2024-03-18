import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class hanging extends StatefulWidget {
  const hanging({Key? key}) : super(key: key);

  @override
  State<hanging> createState() => _hangingState();
}
class _hangingState extends State<hanging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image: "images/hang.jpg",
        placeName: 'The Hanging Church',
        location:'Cairo' ,
        rate: '(3.8)',
        about:'The Hanging Church is named for its location above a gatehouse of Babylon Fortress, the Roman fortress in Coptic Cairo (Old Cairo); its nave is suspended over a passage.[2] The church is approached by twenty-nine steps;'
            ' early travelers to Cairo dubbed it "the Staircase Church".'
            'The land surface has risen by some six metres since the Roman period, '
            'so the Roman tower is mostly buried below ground, reducing the '
            'visual impact of the church\'s elevated position.[citation needed The entrance from the street is through iron gates under a pointed stone arch. The nineteenth-century facade with twin bell towers is then seen beyond a narrow courtyard decorated with modern art biblical designs. Up the steps and through the entrance is a further small courtyard leading to the eleventh-century outer porch.[citation needed]',
        HowToGetThere: "There is no direct connection from Cairo Citadel to Hanging Church. However, you can take the taxi to Sayeda Zainab,"
            " take the line 1 Metro to Mar Girgis, then take the walk to Hanging Church."
            " Alternatively, you can take the taxi to Hanging Church.",
      ),
    );
  }
}