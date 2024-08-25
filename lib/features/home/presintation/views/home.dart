
import 'package:discovery/features/home/presintation/views/widgets/home_view_body.dart';
import 'package:discovery/screens/menu.dart';
import 'package:discovery/utils/firebase.dart';
import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  File? mediaUrl;
  final picker = ImagePicker();
  String? location;
  Position? position;
  Placemark? placemark;
  String? bio;
  String? description;
  String? email;
  String? commentData;
  String? ownerId;
  String? userId;
  String? type;
  File? userDp;
  String? imgLink;
  bool edit = false;
  String? id;

  
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              menu(profileId: firebaseAuth.currentUser!.uid),
            ],
          ),
        ),
      ),
      body: HomeViewBody()
    );
  }

}
