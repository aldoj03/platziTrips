import 'package:flutter/material.dart';
import 'package:flutter__trips/User/ui/widgets/profile.places.dart';
import 'package:flutter__trips/User/ui/widgets/profile_background.dart';
import 'package:flutter__trips/User/ui/screens/profile_header.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()

          ],
        ),
      ],
    );
  }

}