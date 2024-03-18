import 'package:flutter/material.dart';
import '../categories/beaches/Beaches.dart';
import 'package:discovery/widgets/expandableText.dart';
class PlaceWidget extends StatefulWidget {
   PlaceWidget({super.key, required this.image, required this.placeName, required this.location, required this.rate, required this.about, required this.HowToGetThere});
  final String image;
  final String placeName;
  final String location;
  final String rate;
  final String about;
  final String HowToGetThere;

  @override
  State<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  bool favourite = true;

  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                              image: new AssetImage(widget.image),
                              fit: BoxFit.fill)),
                    )  ,
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                        left: 39.0, bottom: 48,),
                      child:
                      Text(widget.placeName,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(
                          right: 39.0,
                          top: 60,
                        ),

                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                favourite =
                                !favourite;
                              });
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: favourite
                                  ? Colors.white24
                                  : Colors.white24,
                              child: favourite
                                  ? Icon(Icons.favorite_border, color: Colors.red)
                                  : Icon(Icons.favorite , color: Colors.red,),
                            ))),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          left: 39.0,
                          top: 60,
                        ),

                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(builder: (context)=> beaches())
                              );
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: favourite
                                  ? Colors.white24
                                  : Colors.white24,
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Color(0xff3e97bd),
                              ),
                            ))),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                        left: 39.0, bottom: 27,),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color:  Color(0xff3e97bd),
                            size: 15,
                          ),
                          Text(widget.location,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color:  Color(0xff3e97bd),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto',

                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(
                        left: 320.0, bottom: 48,),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          Text(
                            widget.rate,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Padding(
                padding:EdgeInsets.only(left: 32,right: 32 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: Color(0xff205065),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ExpandableText(
                      text: widget.about,
                      maxLines:  20,
                      minLines: 5,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        color: Color(0xFF9593a8),
                      ),
                      expandText: 'Read less',
                      collapseText: 'Read more',
                      linkColor: Color(0xff3e97bd),
                      onExpand: () {
                        setState(() {
                          _isExpanded = true;
                        });
                      },
                      onCollapse: () {
                        setState(() {
                          _isExpanded = false;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(color: Colors.black45,),
                    Text(
                      'How To Get There',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: Color(0xff205065),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ExpandableText(
                      text: widget.HowToGetThere,
                      maxLines:  20,
                      minLines: 5,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        color: Color(0xFF9593a8),
                      ),
                      expandText: 'Read less',
                      collapseText: 'Read more',
                      linkColor: Color(0xff3e97bd),
                      onExpand: () {
                        setState(() {
                          _isExpanded = true;
                        });
                      },
                      onCollapse: () {
                        setState(() {
                          _isExpanded = false;
                        });
                      },
                    ),
                    Divider(color: Colors.black45,),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );;
  }
}