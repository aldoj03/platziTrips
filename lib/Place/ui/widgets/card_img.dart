import 'dart:io';

import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardImg extends StatelessWidget {


  final String pathImg;

  double width = 250.0;
  double height = 350.0;
  double left = 20.0;
  VoidCallback onPressedFabIcon;
  final IconData iconData;

  CardImg({Key key, this.pathImg, this.width, this.height, this.iconData, this.left, this.onPressedFabIcon});

  Widget card() {
    return Container(
      height: this.height,
      width: this.width,
      margin: EdgeInsets.only( left: this.left),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: pathImg.contains('assets') ? AssetImage(pathImg) : FileImage(File(pathImg)),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [this.card(), FloatingActionButtonGreen(iconData: this.iconData, onPressed: this.onPressedFabIcon)],
    );
  }
}
