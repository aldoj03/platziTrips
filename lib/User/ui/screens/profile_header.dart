import 'package:flutter/material.dart';
import 'package:flutter__trips/User/bloc/bloc_user.dart';
import 'package:flutter__trips/User/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {

  UserBloc userBloc;
  UserApp user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    showProfileData(AsyncSnapshot snapShot) {
        print('no logueado');

      if (!snapShot.hasData || snapShot.hasError) {
        print('no logueado');
        return dataWidget(null);

      } else {
        print('logueado');
        return dataWidget(snapShot);
      }
    }

   

    return StreamBuilder(
        stream: userBloc.streamFirebase,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
              break;
            case ConnectionState.none:
              return CircularProgressIndicator();
              break;
            case ConnectionState.active:
              return showProfileData(snapshot);
              break;
            case ConnectionState.done:
              return showProfileData(snapshot);
              break;
              
          }
        });
  }

   Widget dataWidget(AsyncSnapshot snapshot) {
     this.user = new UserApp(name: snapshot.data.displayName, email: snapshot.data.email, photoUrl: snapshot.data.photoURL);
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(this.user),
            ButtonsBar()
          ],
        ),
      );
    }
}
