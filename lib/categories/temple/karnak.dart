import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class karnak extends StatefulWidget {
  const karnak({Key? key}) : super(key: key);
  @override
  State<karnak> createState() => _karnakState();
}
class _karnakState extends State<karnak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/karnak.webp",
        placeName: 'Karnak Temple',
        location: 'Luxor',
        rate: '(3.8)',
        about: 'The Karnak Temple Complex, commonly known as Karnak '
            '(/ˈkɑːr.næk/, comprises a vast mix of temples, pylons, chapels, and other buildings near Luxor, Egypt.'
            'The Karnak Temple was built between 2055 BC and around 100 AD. It was built as a cult temple and was dedicated to the gods Amun, ',
        HowToGetThere: "There are 5 ways to get from Cairo to Karnak Temple Complex by train, "
            "plane, bus, taxi or car ; Line 3 Metro, fly · 3h 25m · Fly from Cairo (CAI) to Luxor (LXR)",
      ),
    );
  }
}