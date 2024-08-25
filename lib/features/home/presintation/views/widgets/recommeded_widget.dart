
import 'package:discovery/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/favourite_item.dart';
import '../../../../../view_models/favourite/favourite_view_model.dart';
import '../../../data/models/recommended_model.dart';

class RecommededWidget extends StatefulWidget {
  const RecommededWidget({sup});


  State<RecommededWidget> createState() => _RecommededWidgetState();
}

class _RecommededWidgetState extends State<RecommededWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 210,
            width: 210,
            // ignore: unnecessary_new
            child: new ListView.separated(
              itemCount: RecommendedData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Consumer<WishlistProvider>(
                    builder: (context, wishlist, child) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  RecommendedData[index].button));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      RecommendedData[index].image,
                                      width: 189,
                                      height: 146,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        WishlistItem item =
                                        WishlistItem(
                                          name:  RecommendedData[index].name,
                                          locationName: RecommendedData[index].location,
                                          image: RecommendedData[index].image,
                                        );

                                        setState(() {
                                          RecommendedData[index].favourite =
                                          !RecommendedData[index].favourite;
                                        });

                                        if (RecommendedData[index].favourite) {
                                          wishlist.addItem(item);
                                        } else {
                                          wishlist.deleteItem(item);
                                         !RecommendedData[index].favourite;
                                        };
                                      },
                                      icon: CircleAvatar(
                                        radius: 15.0,
                                        backgroundColor: Colors.white24,
                                        child: !RecommendedData[index].favourite
                                            ? Icon(
                                            Icons.favorite_border,
                                            color: Colors.red)
                                            : Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: 186,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      RecommendedData[index].name,
                                      maxLines: 2,
                                      style: Styles.textStyle14,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16,
                                        ),
                                        Text(
                                          RecommendedData[index].rate,
                                          style: Styles.textStyle11
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                width: 186,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      RecommendedData[index].location,
                                      style: const TextStyle(
                                          overflow: TextOverflow.clip,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Colors.grey),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
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
