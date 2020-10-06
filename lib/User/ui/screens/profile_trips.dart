// import 'package:flutter/material.dart';
// import 'package:flutter__trips/User/ui/widgets/profile.places.dart';
// import 'package:flutter__trips/User/ui/screens/profile_header.dart';
// import 'package:flutter__trips/widgets/gradient_back.dart';

// class ProfileTrips extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     /*return Container(
//       color: Colors.indigo,
//     );*/
//     return Stack(
//       children: <Widget>[
//         GradientBack(height: 300.0),
//         ListView(
//           children: <Widget>[
//             ProfileHeader(),
//             ProfilePlacesList()

//           ],
//         ),
//       ],
//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:flutter__trips/User/bloc/bloc_user.dart';
import 'package:flutter__trips/User/ui/widgets/profile.places.dart';
import 'package:flutter__trips/User/ui/screens/profile_header.dart';
import 'package:flutter__trips/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;

  Widget showProfileData(AsyncSnapshot snapshot) {
    
    return Stack(
      children: <Widget>[
        GradientBack(height: 300.0),
        ListView(
          children: [ProfileHeader(), ProfilePlacesList()],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return showProfileData(snapshot);

            case ConnectionState.active:
              return showProfileData(snapshot);

            case ConnectionState.none:
              return CircularProgressIndicator();
          }
        });
  }
}
