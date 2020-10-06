import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
   String title = 'Popular';
  double height = 0.0;
  double screenHeight = 0.0;
  double width = 0.0;

  GradientBack({ Key key, this.height});


  Widget gradient() {
    return Container(
      height: this.height,
      width: this.width,
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
      child: 
      // Text(this.title,
      //     style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 30.0,
      //         fontWeight: FontWeight.bold)),
      FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          margin: EdgeInsets.only(bottom: 40.0),
          width: this.screenHeight,
          height: this.screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(height*2)
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    this.screenHeight =   MediaQuery.of(context).size.height;
    this.height = this.height == null ? this.screenHeight : this.height;
    this.width = this.width == 0.0 ? MediaQuery.of(context).size.width : this.width    ;

    final gradient = this.gradient();

    return Container(
      child: gradient,
    );
  }
}
