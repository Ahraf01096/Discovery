import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class royal extends StatefulWidget {
  const royal({Key? key}) : super(key: key);
  @override
  State<royal> createState() => _royalState();
}
class _royalState extends State<royal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image:"images/royal.webp",
        placeName: 'The Royal Museum Of Jewelry',
        location: 'Cairo',
        rate: '(4.2)',
        about: 'The Royal Jewelry Museum displays the collectibles of the Egyptian royal family, founded by Muhammad Ali Pasha in 1805 and continued to rule for 150 years, until 1952'
            'Zaynab Fahmi built the palace in 1919 in Zizinya, Alexandria. It served as the residence of Fatma al- Zahra’, daughter of Prince Ali Haider, a descendent of Muhammad Ali Pasha'
            'The palace serves as a striking backdrop to the magnificent possessions owned by the family. It uniquely merges between European and Islamic styles'
            'The possessions amassed by the family over the period of their rule are on display in the various halls. A diamond and emerald inlaid collar belonging to the founder of the dynasty, Muhammad Ali Pasha, is among the museum’s collection.'
            'The lavish lifestyle of the family is reflected in a gold chessboard, golden binoculars encrusted with diamonds, rubies, emeralds, and gold cups inlaid with precious stones. Also on display are elaborate jewelry sets commissioned by the greatest designers in Europe, which once adorned the queens and princesses of Egypt’s royal family.',
        HowToGetThere: "Cairo to Alexandria by bus"
            "The bus journey time between Cairo and Alexandria is around 3h and covers a distance of around 217 km. Operated by Go Bus Egypt and West and Middle delta, the Cairo to Alexandria bus service departs from Kolaly and arrives in Alexandria Moharam Bek"
            "then take a bus or taxi to 21 Ahmed Yehia Street Zizinia. (Glim)",
      ),
    );
  }
}