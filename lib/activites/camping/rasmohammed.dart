import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class rasmohammed extends StatefulWidget {
  const rasmohammed({Key? key}) : super(key: key);

  @override
  State<rasmohammed> createState() => _rasmohammedState();
}
class _rasmohammedState extends State<rasmohammed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceWidget(
        image: "images/rasmohammedcam.webp",
        placeName: 'Ras Mohammed ',
        location: 'sinai peninsula',
        rate: '(3.7)',
        about: "When the Sinai Peninsula was returned to Egypt, Ras Muhammad "
            "was declared for protection from fishing and other human activities. Some of the fishing methods, "
            "such as using dynamite and knives were also impacting on the coral reef and the fish populations. In 1983,"
            " the Egyptian Environmental Affairs Agency (EEAA) established the area as a marine reserve for"
            " the protection of marine and terrestrial wildlife. The park was also established to protect against urban"
            " sprawl from Sharm El Sheikh and other coastal development.[2] The name literally means "
            "Cape of Mehammad, where in this instance means headland. It is "
            "said in the area that the name arose because in side view the contour of the cliff looks like the profile of "
            "a bearded man's face, with horizontal hard strata providing the nose and bearded chin. ",
        HowToGetThere: "The best way to get from Cairo to Ras Muhammad National"
            " Park is to fly which takes 4h 1m and costs \$45 - \$120. Alternatively,"
            " you can bus, which costs \$20 - \$25 and takes 8h 30m",
      ),
    );
  }
}