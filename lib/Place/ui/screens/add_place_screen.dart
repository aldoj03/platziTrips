import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter__trips/Place/model/place.dart';
import 'package:flutter__trips/Place/ui/widgets/card_img.dart';
import 'package:flutter__trips/Place/ui/widgets/text_input.dart';
import 'package:flutter__trips/Place/ui/widgets/title_input_location.dart';
import 'package:flutter__trips/User/bloc/bloc_user.dart';
import 'package:flutter__trips/widgets/button_purple.dart';
import 'package:flutter__trips/widgets/gradient_back.dart';
import 'package:flutter__trips/widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  final File image;

  AddPlaceScreen({Key key, this.image}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

   bool loading = false;

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    Future<StorageUploadTask> uploadFile() {
      final  user = userBloc.currentUser() ;
      String path = "${user.uid}/${DateTime.now().toString()}.jpg";
      print(path);
      return userBloc.uploadFIle(path, widget.image);
    }

    Future savePlace(Place place) {
      return userBloc.updatePlace(place);
    }

    return Scaffold(
        body: Stack(
      children: [
        GradientBack(height: 250.0),
        Row(children: [
          Container(
            padding: EdgeInsets.only(top: 25.0, left: 5.0),
            child: SizedBox(
                height: 45.0,
                width: 45.0,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left,
                      color: Colors.white, size: 45),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(
                top: 45.0,
                left: 20.0,
              ),
              child: TitleHeader(title: 'Add a new Place '),
            ),
          ),
        ]),
        Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  alignment: Alignment.center,
                  child: CardImg(
                      pathImg: widget.image.path,
                      iconData: Icons.camera_alt,
                      width: 350.0,
                      height: 240.0,
                      left: 0),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hint: 'Title',
                    maxLines: 1,
                    inputType: null,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hint: 'Description',
                  maxLines: 3,
                  inputType: TextInputType.multiline,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                      hint: 'Add Location', iconData: Icons.location_on),
                ),
                Container(
                  child: !loading ? ButtonPurple(
                      buttonText: 'Add Place',
                      onPressed: () {
                        loading = true;
                        uploadFile()
                            .then((StorageUploadTask value) => value.onComplete)
                            .then((snapShot2) => snapShot2.ref.getDownloadURL())
                            .then((url) => savePlace(Place(
                                  name: _controllerTitlePlace.text,
                                  description: _controllerDescriptionPlace.text,
                                  likes: 0,
                                  urlImage: url,
                                  
                                )))
                            .whenComplete(() => Navigator.pop(context))
                            .catchError((onError) => print(onError));
                      }) : CircularProgressIndicator(),
                )],
            )
          )
      ],)
    );
  }
}
