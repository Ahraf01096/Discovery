import 'dart:io';

import 'package:discovery/utils/constants.dart';
import 'package:discovery/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:discovery/features/feed/presintation/views_model/posts_view_model.dart';
import 'package:discovery/widgets/indicators.dart';

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    PostsViewModel viewModel = Provider.of<PostsViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        viewModel.resetPost();
        return true;
      },
      child: LoadingOverlay(
          progressIndicator: circularProgress(context),
          isLoading: viewModel.loading,
          child: Scaffold(
            key: viewModel.scaffoldKey,
            body: Container(
              color: Colors.grey.shade200,
              child: ListView(
                children: <Widget>[
                  Column(children: <Widget>[
                    new Container(
                      color: Colors.grey.shade200,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 120),
                            child: new Stack(fit: StackFit.loose, children: [
                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        showImageChoices(context, viewModel),
                                    child: viewModel.imgLink != null
                                        ? const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 75,
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              size: 80,
                                              color: Color(0xff3e97bd),
                                            ),
                                          )
                                        : viewModel.mediaUrl == null
                                            ? CircleAvatar(
                                                backgroundColor:
                                                    Color(0xff3e97bd),
                                                radius: 76,
                                                child: const CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 75,
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 80,
                                                    color: Color(0xff3e97bd),
                                                  ),
                                                ),
                                              )
                                            : CircleAvatar(
                                                backgroundImage: FileImage(
                                                    viewModel.mediaUrl!
                                                        as File),
                                                radius: 75,
                                              ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 56),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Add Profile Photo',
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    color: Color(0xff27678a),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Add a profile photo so that your friends know \n                                  '
                                  'it’s you.',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: Color(0xff27678a),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                CustomButton(
                                  height: 50,
                                  width: 220,
                                  backgroundColor: Constants.kSecondColor,
                                  textColor: Colors.white,
                                  text: 'Add Your Photo',
                                  onPressed: () =>
                                      showImageChoices(context, viewModel),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                CustomButton(
                                  height: 50,
                                  width: 220,
                                  backgroundColor: Colors.white,
                                  textColor: Constants.kSecondColor,
                                  text: 'Finish',
                                  onPressed: () =>
                                      viewModel.uploadProfilePicture(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ),
          )),
    );
  }

  showImageChoices(BuildContext context, PostsViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Select from'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Ionicons.camera_outline),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage(camera: true);
                },
              ),
              ListTile(
                leading: Icon(Ionicons.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage();
                  // viewModel.pickProfilePicture();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
