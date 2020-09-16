import 'package:flutter/material.dart';
import '../../../widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String placeName;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.placeName, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    final descriptionPlace = Container(
        margin: EdgeInsets.only(
          top: 20.0,
          right: 20.0,
          left: 20.0,
        ),
        child: Column(
          children: [
            Text(
              this.descriptionPlace,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF56575a)),
            ),
            ButtonPurple('Navigate'),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));

    final starHalf = Container(
      margin: EdgeInsets.only(top: 323.0, left: 5),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2c611),
      ),
    );
    final starBorder = Container(
      margin: EdgeInsets.only(top: 323.0, left: 5),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2c611),
      ),
    );
    final star = Container(
      margin: EdgeInsets.only(top: 323.0, left: 5),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2c611),
      ),
    );

    final titleStars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
          child: Text(this.placeName,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
              textAlign: TextAlign.left),
        ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            starHalf,
            starBorder,
          ],
        )
      ],
    );
    return Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[titleStars, descriptionPlace],
        ));
  }
}
