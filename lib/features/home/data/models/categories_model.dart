import 'package:flutter/cupertino.dart';

import '../../../../categories/beaches/Beaches.dart';
import '../../../../categories/churche/churches.dart';
import '../../../../categories/desert/desert.dart';
import '../../../../categories/mosque/mosque.dart';
import '../../../../categories/mountains/mountains.dart';
import '../../../../categories/museum/museum.dart';
import '../../../../categories/restaurant/restaurants.dart';
import '../../../../categories/temple/temples.dart';

class CategoriesModel {
  final String CategoryName;
  final String CategoryImage;
  final Widget Button;

  CategoriesModel(
      {required this.CategoryName,
      required this.CategoryImage,
      required this.Button});
}

List<CategoriesModel> CategoryData = [
  CategoriesModel(
    CategoryName: 'Mountains',
    CategoryImage: 'images/categories/mountain.png',
    Button: mountains(),
  ),
  CategoriesModel(
    CategoryName: 'Beaches',
    CategoryImage: 'images/categories/beach_icon.png',
    Button: beaches(),
  ),
  CategoriesModel(
    CategoryName: 'Desert',
    CategoryImage: 'images/categories/desert_icon.png',
    Button: desert(),
  ),
  CategoriesModel(
    CategoryName: 'Mosques',
    CategoryImage: 'images/categories/mosque_icon.png',
    Button: mosque(),
  ),
  CategoriesModel(
    CategoryName: 'Churches',
    CategoryImage: 'images/categories/churches.png',
    Button: churches(),
  ),
  CategoriesModel(
    CategoryName: 'Museums',
    CategoryImage: 'images/categories/museum.png',
    Button: museum(),
  ),
  CategoriesModel(
    CategoryName: 'Temple',
    CategoryImage: 'images/categories/temple.png',
    Button: temples(),
  ),
  CategoriesModel(
    CategoryName: 'Restaurants',
    CategoryImage: 'images/categories/resturant.png',
    Button: restaurants(),
  ),
];
