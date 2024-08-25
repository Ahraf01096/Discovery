import 'package:discovery/features/home/presintation/views/widgets/recommeded_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/styles.dart';
import 'activities_widget.dart';
import 'categories_widget.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(
            height: 30,
          ),
          Text(
            'Categories',
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: 15,
          ),
          CategoriesWidget(),
          SizedBox(
            height: 30,
          ),
          Text(
            'Recommended',
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: 15,
          ),
          RecommededWidget(),
          SizedBox(
            height: 30,
          ),
          Text(
            'Activities',
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: 15,
          ),
          ActivitiesWidget(),
        ],
      ),
    );
  }
}
