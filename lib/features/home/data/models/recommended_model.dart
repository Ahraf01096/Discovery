import 'package:flutter/cupertino.dart';

import '../../../../categories/museum/egypt.dart';
import '../../../../categories/museum/royal.dart';
import '../../../../recommended/beachlife.dart';
import '../../../../recommended/khanelkhalili.dart';

class RecommendModel {
  final String name;
  final String image;
  final Widget button;
  final String rate;
  final String location;
  bool favourite;

  RecommendModel(
      {required this.name,
      required this.image,
      required this.button,
      required this.rate,
      required this.location,
      required this.favourite,});
}

List<RecommendModel> RecommendedData = [
  RecommendModel(
      name: 'Khan El Khalili ',
      image: 'images/recommended/khan.jpg',
      button: khanelkalili(),
      rate: '4.9',
      location: 'Cairo',
      favourite: false,
  ),
  RecommendModel(
      name: 'Museum Of Egypt',
      image: 'images/recommended/museum.webp',
      button: egypt(),
      rate: '4.8',
      location: 'Tahrir Square, Cairo',
   favourite:  false,
  ),
  RecommendModel(
   favourite:  false,
    name: 'Beach Life',
    image: 'images/recommended/beach1.jpg',
    button: beachlife(),
    rate: '4.8',
    location: 'South Sinai',
  ),
  RecommendModel(
     favourite:  false,
      name: 'The Royal Museum',
      image: 'images/recommended/royal.webp',
      button: royal(),
      rate: '4.7',
      location: 'Cairo')
];
