import 'package:flutter/material.dart';
import 'package:discovery/categories/beaches/dahab.dart';
import 'package:discovery/categories/beaches/shoreOfAgiba.dart';
import 'package:discovery/categories/churche/cave.dart';
import 'package:discovery/categories/churche/saint.dart';
import 'package:discovery/categories/desert/bahariya.dart';
import 'package:discovery/categories/desert/fayoum.dart';
import 'package:discovery/categories/desert/white.dart';
import 'package:discovery/categories/mosque/alaqmar.dart';
import 'package:discovery/categories/mosque/alazhar.dart';
import 'package:discovery/categories/mosque/amr.dart';
import 'package:discovery/categories/museum/national.dart';
import 'package:discovery/categories/museum/royal.dart';
import 'package:discovery/categories/restaurant/charlies.dart';
import 'package:discovery/categories/temple/abosimbel.dart';
import 'package:discovery/categories/temple/hatshepsut.dart';
import 'package:discovery/categories/temple/karnak.dart';
import 'package:discovery/categories/temple/luxor.dart';
import '../../../../categories/beaches/AlexBeach.dart';
import '../../../../categories/beaches/northcoast.dart';
import '../../../../categories/churche/hanging.dart';
import '../../../../categories/desert/siwa.dart';
import '../../../../categories/mosque/mohamedali.dart';
import '../../../../categories/mountains/GalalaMountain.dart';
import '../../../../categories/mountains/SerpalMountain.dart';
import '../../../../categories/mountains/mountmusa.dart';
import '../../../../categories/mountains/saintcatherine.dart';
import '../../../../categories/museum/egypt.dart';
import '../../../../categories/museum/grand.dart';
import '../../../../categories/restaurant/pasta.dart';
import '../../../../categories/restaurant/thecrust.dart';

class PlaceModel {
  final String name;
  final String location;
  final String image;
  final Widget button;
  bool favourite;

  PlaceModel(
      {required this.name,
        required this.location,
        required this.image,
        required this.button,
        required this.favourite});
}

final List<PlaceModel> place = [
  PlaceModel(
      name: 'Saint Catherine  ',
      location: 'Sinai',
      image: 'images/saint.webp',
      button: saintcatherine(),
      favourite: false),
  PlaceModel(
      name: 'Mount Musa',
      location: 'Sinai',
      image: 'images/musa.webp',
      button: mountmusa(),
      favourite: false),
  PlaceModel(
      name: 'Shore Of Agiba',
      location: 'Marsa Matruh',
      image: 'images/agiba.webp',
      button: Agiba(),
      favourite: false),
  PlaceModel(
      favourite: false,
      name: 'Alexandria Beach',
      location: 'ALexanadria ',
      image: 'images/alex.jpg',
      button: AlexBeach()),
  PlaceModel(
      favourite: false,
      name: 'Dahab',
      location: 'South Sainai',
      image: 'images/dahab.webp',
      button: Dahab()),
  PlaceModel(
      favourite: false,
      name: 'North Coast ',
      location: 'Marsa Matruh',
      image: 'images/north.webp',
      button: NorthCoast()
  ),
  PlaceModel(
      favourite: false,
      name: 'Galala Mountain',
      location: 'Suez Government',
      image: 'images/galala.jpg',
      button: galala()
  ),
  PlaceModel(
      favourite: false,
      name: 'Serpal Mountain ',
      location: 'South Sinai',
      image: 'images/serpal.jpg',
      button: serpal()
  ),
  PlaceModel(
      favourite: false,
      name: 'White Desert',
      location: 'Farafra Oasis',
      image: 'images/white.jpg',
      button: white()
  ),
  PlaceModel(
      favourite: false,
      name: 'Bahariya Oasis ',
      location: 'Al wahat Al Bahariya',
      image: 'images/baharia.webp',
      button: bahariya()
  ),
  PlaceModel(
      favourite: false,
      name: 'Mohamed Ali Mosque',
      location: 'Cairo',
      image: 'images/mohamed.jpg',
      button: mohamedali()
  ),
  PlaceModel(
      favourite: false,
      name: 'Al-Aqmar Mosque',
      location: 'Al Moez Street ,Cairo ',
      image: 'images/alaqmar.JPG',
      button: alaqmar()
  ),
  PlaceModel(
      favourite: false,
      name: 'Al-Azhar Mosque ',
      location: 'Cairo',
      image: 'images/alazhar.webp',
      button: alazhar()
  ),
  PlaceModel(
      favourite: false,
      name: 'Amr Ibn Al-Aas Mosque',
      location: 'Cairo',
      image: 'images/amr.JPG',
      button: amr()
  ),
  PlaceModel(
      favourite: false,
      name: 'Fayoum Desert',
      location: 'Fayoum Government',
      image: 'images/fayoum.webp',
      button: fayoum()
  ),
  PlaceModel(
      favourite: false,
      name: 'Siwa',
      location: 'Western Desert ',
      image: 'images/siwa.webp',
      button: siwa()
  ),
  PlaceModel(
      favourite: false,
      name: 'Grand Egyptian Museum ',
      location: 'Giza',
      image: 'images/mu1.jpg',
      button: grand()
  ),
  PlaceModel(
      favourite: false,
      name: 'The Royal Museum Of Jewelry',
      location: 'ALexandria',
      image: 'images/recommended/royal.webp',
      button: royal()
  ),
  PlaceModel(
      favourite: false,
      name: 'Celestial Cathedral',
      location: 'Sharm El-Shaikh',
      image: 'images/Celestial.jpg',
      button: charlies()
  ),
  PlaceModel(
      favourite: false,
      name: '  Saint Gerges Church',
      location: 'Cairo',
      image: 'images/Saint.jpg',
      button: saint()
  ),
  PlaceModel(
      favourite: false,
      name: 'Cave Church',
      location: 'Mokattam, Cairo',
      image: 'images/Cave.jpg',
      button: Cave()
  ),
  PlaceModel(
      favourite: false,
      name: 'The Hanging Church Coptic Virgin Mary',
      location: 'Cairo',
      image: 'images/hang.jpg',
      button: hanging()
  ),
  PlaceModel(
    favourite: false,
    name: 'Museum Of Egypt',
    location: 'Tahrir Square, Cairo',
    image: 'images/recommended/museum.webp',
    button: egypt(),
  ),
  PlaceModel(
      favourite: false,
      name: 'National Musuem Of Egypt',
      location: ' Cairo ',
      image: 'images/mu4.jpg',
      button: national()
  ),
  PlaceModel(
      favourite: false,
      name: 'Karnak Temple',
      location: 'Luxor',
      image: 'images/karnak.webp',
      button: karnak()
  ),
  PlaceModel(
      favourite: false,
      name: 'Hatshepsut Temple',
      location: 'Luxor',
      image: 'images/Hatshepsut .webp',
      button: hatshepsut()
  ),
  PlaceModel(
      favourite: false,
      name: 'Charlie’s ',
      location: 'El Korba,Cairo',
      image: 'images/charlies.jpg',
      button: charlies()
  ),
  PlaceModel(
      favourite: false,
      name: 'What The Crust ',
      location: 'Maadi,Cairo',
      image: 'images/thecrust.jpg',
      button: thecrust()
  ),
  PlaceModel(
      favourite: false,
      name: 'O’s Pasta',
      location: 'Zamalek, Cairo',
      image: 'images/os.webp',
      button: pasta()
  ),
  PlaceModel(
      favourite: false,
      name: 'Luxor Temple',
      location: 'Luxor',
      image: 'images/luxor.webp',
      button: luxor()
  ),
  PlaceModel(
      favourite: false,
      name: 'Abo Simbel',
      location: 'Aswan',
      image: 'images/simbel.webp',
      button: abosimbel()
  ),
];