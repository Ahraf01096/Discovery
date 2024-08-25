
import 'package:flutter/material.dart';

import '../../../../../utils/styles.dart';
import '../../../data/models/categories_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40.5,
            child: new ListView.separated(
              itemCount: CategoryData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            CategoryData[index].Button));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Image.asset(CategoryData[index].CategoryImage,width: 20,height: 20,),
                        SizedBox(width: 5,),
                        Text(
                          CategoryData[index].CategoryName,
                          style: Styles.textStyle11,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
