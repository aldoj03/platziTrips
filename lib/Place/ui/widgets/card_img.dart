import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardImg extends StatelessWidget {
  String pathImg;

  CardImg(this.pathImg);

  Widget card() {
    return Container(
      height: 350.0,
      width: 350.0,
      margin: EdgeInsets.only(top: 80.0, left: 20.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(this.pathImg),
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
      children: [this.card(), FloatingActionButtonGreen()],
    );
  }
}
