import 'package:flutter/material.dart';
import '../../../../../utils/styles.dart';

import '../../../data/models/activites_model.dart';

class ActivitiesWidget extends StatelessWidget {
  const ActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: false,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(bottom: 22),
        itemCount: ActivitiesData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 4 / 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      ActivitiesData[index].Button));
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image(image: AssetImage(ActivitiesData[index].ActivityImage,),height: 150,width: 210,fit: BoxFit.fill,),
                ),
                Center(
                  child: Text(
                      ActivitiesData[index].ActivityName,
                      style: Styles.textStyle20.copyWith(color: Colors.white70)
                  ),
                ),

              ],
            ),
          );
        },

      ),
    );
  }
}
