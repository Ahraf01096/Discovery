import 'package:flutter/material.dart';

import '../../../../activites/camping/camping.dart';
import '../../../../activites/diving/diving.dart';
import '../../../../activites/safari/safari.dart';

import '../../presintation/views/widgets/see_more_activities.dart';

class ActivitiesModel {
  final String ActivityName;
  final String ActivityImage;
  final Widget Button;

  ActivitiesModel(
      {required this.ActivityName,
      required this.ActivityImage,
      required this.Button});
}

List<ActivitiesModel> ActivitiesData = [
  ActivitiesModel(
    ActivityName: 'Camping',
    ActivityImage: 'images/activities/camping.jpeg',
    Button: camping(),
  ),
  ActivitiesModel(
    ActivityName: 'Safari',
    ActivityImage: 'images/activities/safari.jpg',
    Button: safari(),
  ),
  ActivitiesModel(
      ActivityName: 'Diving',
      ActivityImage: 'images/activities/diving.webp',
      Button: diving()),
  ActivitiesModel(
      ActivityName: 'See More..',
      ActivityImage: "images/activities/see more.jpg",
      Button: SeeMoreActivities())
];
