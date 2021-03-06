import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter__trips/Place/ui/screens/add_place_screen.dart';
import 'package:flutter__trips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    this.userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(true, Icons.vpn_key, 20.0,
                Color.fromRGBO(255, 255, 255, 1), () => true),
            CircleButton(
                false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () {
              ImagePicker()
                  .getImage(source: ImageSource.camera)
                  .then((PickedFile image) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddPlaceScreen(image: File(image.path))))
                      })
                  .catchError((onError) => print(onError));
            }),
            CircleButton(
                true,
                Icons.exit_to_app,
                20.0,
                Color.fromRGBO(255, 255, 255, 0.6),
                () => this.userBloc.signOut()),
          ],
        ));
  }
}
