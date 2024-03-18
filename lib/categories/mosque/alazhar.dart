import 'package:flutter/material.dart';
import '../../widgets/placeWidget.dart';
class alazhar extends StatefulWidget {
  const alazhar({Key? key}) : super(key: key);
  @override
  State<alazhar> createState() => _alazharState();
}
class _alazharState extends State<alazhar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PlaceWidget(
        image: "images/alazhar.webp",
        placeName: 'Al-Azhar Mosque',
        location: 'Cairo',
        rate: '(3.8)',
        about: "Al-Azhar Mosque (Arabic: الجامع الأزهر, romanized: al-Jāmiʿ al-ʾAzhar,'The Resplendent Congregational Mosque', Egyptian Arabic: جامع الأزهر, romanized: Gāmiʿ el-ʾazhar), known in Egypt simply as al-Azhar, is a mosque in Cairo, Egypt in the historic Islamic core of the city. Commissioned by Jawhar al-Siqilli shortly after Cairo was established as the new capital of the Fatimid Caliphate in 970, it was the first mosque established in a city that eventually earned the nickname "
            "the City of a Thousand Minarets Its name is usually thought to derive from az-Zahrāʾ , a title given to Fatimah, the daughter of Muhammad"
            "After its dedication in 972, and with the hiring by mosque authorities of 35 scholars in 989, the mosque slowly developed into what is today the second oldest continuously run university in the world after Al-Qarawiyyin in Idrisid Fes. Al-Azhar University has long been regarded as the foremost institution in the Islamic world for the study of Sunni theology and sharia, or Islamic law. The university, integrated within the mosque as part of a mosque school since its inception, was nationalized and officially designated an independent university in 1961, Al-Azhar Al Sharif, following the Egyptian Revolution of 1952.",
        HowToGetThere: "The Al Azhar Mosque is in El Hussein Square, next to the Al Azhar university. The best way to get there is by cab or on a tour."
            " If you want to use Cairo’s metro, the nearest station is Ataba, about an 18-minute walk away along Kobri Al Azhar street.",
      ),
    );
  }
}