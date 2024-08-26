
import 'package:discovery/features/search/presintation/views/search_user.dart';
import 'package:discovery/utils/constants.dart';
import 'package:discovery/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../../../../models/favourite_item.dart';
import '../../../../utils/styles.dart';
import '../../../../view_models/favourite/favourite_view_model.dart';
import '../../../../screens/navigation_screens.dart';
import '../../data/models/place_model.dart';

final List<Widget> buttons1 = <Widget>[
  SearchPlace(),
  SearchUser(),
];
final List<Color> colors = <Color>[
  Color.fromARGB(100, 241, 251, 255),
  Color.fromARGB(100, 255, 255, 255),
];
final List<String> namess = <String>[
  'Place',
  'Account',
];



class SearchPlace extends StatefulWidget {
  @override
  _SearchPlaceState createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  String searchText = '';
  TextEditingController searchController = TextEditingController();
  Widget _buildAccountList() {
    List<PlaceModel> filteredAccounts = place
        .where((account) =>
            account.name.toLowerCase().contains(searchText.toLowerCase()) ||
            account.location.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return GestureDetector(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: filteredAccounts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (
          BuildContext context,
          index,
        ) {
          PlaceModel account = filteredAccounts[index];
          return Center(
            child: Consumer<WishlistProvider>(builder: (context, wishlist, child) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (_) => account.button));
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              account.image,
                              width: 189,
                              height: 146,
                              fit: BoxFit.fill,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                WishlistItem item = WishlistItem(
                                  name: account.name,
                                  locationName: account.location,
                                  image: account.image,
                                );

                                setState(() {
                                  account.favourite = !account.favourite;
                                });

                                if (account.favourite) {
                                  wishlist.addItem(item);
                                } else {
                                  wishlist.deleteItem(item);
                                  !account.favourite;
                                }
                                ;
                              },
                              icon: CircleAvatar(
                                radius: 15.0,
                                backgroundColor: Colors.white24,
                                child: !account.favourite
                                    ? Icon(Icons.favorite_border,
                                        color: Colors.red)
                                    : Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 186,
                        child: Text(
                          account.name,
                          maxLines: 3,
                          style: Styles.textStyle14,
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
                              account.location,
                              style: const TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.grey),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade200,
          toolbarHeight: 80,
          elevation: 0.0,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => NavigationScreens()));
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
              Text('Search Place',
                  textAlign: TextAlign.start,
                  style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w500)),
              Spacer(),
              CustomButton(backgroundColor: Colors.white, textColor: Constants.kSecondColor, text: 'User',onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                       SearchUser()));
              },)
            ],
          )),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Container(
              width: 329,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  style: Styles.textStyle18,
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          searchController.clear();
                        },
                        child: Icon(
                          Ionicons.close_outline,
                          size: 17.0,
                          color: Constants.kSecondColor,
                        ),
                      ),
                      hintText: 'Search ..',
                      hintStyle: Styles.textStyle16.copyWith(color: Color(0xFF9593a8),),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _buildAccountList(),
            ),
          ],
        ),
      ),
    );
  }
}
