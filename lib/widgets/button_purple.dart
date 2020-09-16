import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  String buttonText;

  ButtonPurple(this.buttonText);

  getButton(context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Navegando'),
        ));
      },
      child: Container(
          margin: EdgeInsets.only(top: 30.0, right: 20.0),
          height: 50.0,
          width: 180.0,
          child: Center(
              child: Text(
            this.buttonText,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: this.getButton(context));
  }
}