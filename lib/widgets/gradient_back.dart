import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = 'Popular';
  double height = 0.0;

  GradientBack(this.title, this.height);

  Widget gradient() {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF4268D3), Color(0xFF5846D1)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0))),
      child: Text(this.title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold)),
      alignment: Alignment(-0.9, -0.6),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gradient = this.gradient();

    return Container(
      child: gradient,
    );
  }
}
