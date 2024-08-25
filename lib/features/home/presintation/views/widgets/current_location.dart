import 'package:discovery/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../utils/styles.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  bool loading = false;
  Position? position;
  String? location;
  Placemark? placemark;
  TextEditingController locationTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Current Location",
              textAlign: TextAlign.center,
              style: Styles.textStyle16.copyWith(color: Constants.kPrimaryColor)),
          InkWell(
            onTap: () => getLocation(),
            child: Container(
              width: 260,
              height: 40,
              child: TextFormField(
                controller: locationTEC,
                decoration: InputDecoration(
                  hintText: 'tap here!'.toUpperCase(),
                  hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff205065)),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(0),
                      borderSide: BorderSide.none),
                ),
                readOnly: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff205065)),
                onChanged: (val) => setLocation(val),

              ),
            ),
          ),
        ]);
  }

  getLocation() async {
    loading = true;
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission rPermission = await Geolocator.requestPermission();
      print(rPermission);
      await getLocation();
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);
      placemark = placemarks[0];
      location = " ${placemarks[0].locality}, ${placemarks[0].country}";
      locationTEC.text = location!;
      print(location);
    }
    loading = false;
  }

  setLocation(String val) {
    print('SetCountry $val');
    location = val;
  }
}
