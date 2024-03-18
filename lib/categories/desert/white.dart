import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class white extends StatefulWidget {
  const white({Key? key}) : super(key: key);
  @override
  State<white> createState() => _whiteState();
}
class _whiteState extends State<white> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image:'images/white.jpg' ,
        placeName: 'White Desert',
        location: 'Farafra Oasis',
        rate: '(3.9)',
        about: "Sahara el Beyda, the White Desert Protected Area, is a national park in Egypt, "
            "first established as a protected area in 2002. It is located in the Farafra depression, 45 km (28 mi) north of the town of Qsar El Farafra. Part of the park is in the Farafra Oasis (New Valley Governorate).[1]"
            "The park is the site of large white chalk rock formations, created through erosion by wind and sand. It is also the site of cliffs (at the northern end of the Farafra Depression), sand dunes (part of the Great Sand Sea), as well as Wadi Hennis and oases at Ain El Maqfi and Ain El Wadi."
            "White Desert National Park covers an area of 3,010 km2 (1,160 sq mi). The highest point in the park is at El Qess Abu Said at 353 m (1,158 ft) above sea level, and the lowest is at Wadi Hennis at 32 m (105 ft).[2]",
        HowToGetThere: "The White Desert is only about 4-5 hours away from Cairo. You can arrange transportation with a driver, or use a local bus. Typically, you will be picked up in the morning from your hotel, spend the night in the oasis (not as charming as it sounds), and depart early the next morning for the desert.",
      ),
      );
  }
}