
import 'package:discovery/categories/restaurant/charlies.dart';
import 'package:discovery/categories/restaurant/pasta.dart';
import 'package:discovery/categories/restaurant/thecrust.dart';
import 'package:discovery/screens/navigation_screens.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/presintation/views/widgets/categories_widget.dart';

class restaurants extends StatefulWidget {
  @override
  State<restaurants> createState() => _restaurantsState();
}

class _restaurantsState extends State<restaurants> {
  final List<Widget> buttons = <Widget>[
    charlies(),
    thecrust(),
    pasta(),
  ];

  final List<bool> favourite = <bool>[
    true,
    true,
    true,
    true,
  ];
  final List<String> names = <String>[
    'El Korba,Cairo',
    'Maadi,Cairo',
    'Zamalek, Cairo',
  ];
  final List<String> images = <String>[
    'images/charlies.jpg',
    'images/thecrust.jpg',
    'images/os.webp',
  ];

  final List<String> names2 = <String>[
    'Charlie’s        ',
    'The Crust     ',
    'O’s Pasta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade200,
          toolbarHeight: 80,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,

                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(
                        builder: (_) => TabScreen()),(route) => false,
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xff3e97bd),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),

              SizedBox(
                width: 275,
              ),

            ],
          )),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.only(top: 5, left: 32, right: 32),
          child: Column(
            children: [
              CategoriesWidget(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 10000,
                      child: ListView.separated(
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => buttons[index]));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        images[index],
                                        width: 380,
                                        height: 135,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 20.0, bottom: 25.0),
                                      child: Text(
                                        names2[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.only(
                                          left: 200.0,
                                          bottom: 80,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              favourite[index] =
                                              !favourite[index];
                                            });
                                          },
                                          icon: CircleAvatar(
                                            radius: 15.0,
                                            backgroundColor: favourite[index]
                                                ? Colors.white24
                                                : Colors.white24,
                                            child: favourite[index]
                                                ? Icon(Icons.favorite_border, color: Colors.red)
                                                : Icon(Icons.favorite , color: Colors.red,),
                                          ),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 20.0, bottom: 10.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Text(names[index],
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
