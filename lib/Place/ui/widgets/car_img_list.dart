import 'package:flutter/material.dart';
import 'package:flutter__trips/Place/ui/widgets/card_img.dart';

class CardListImage extends StatelessWidget {
  Widget generateList() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Container(
        height: 350.0,
        child: ListView(
          padding: EdgeInsets.all(25.0),
          scrollDirection: Axis.horizontal,
          children: [
            CardImg(pathImg: 'assets/images/mountain_stars.jpeg', iconData: Icons.favorite_border, height: 250.0, width: 350.0, left: 20.0),
            CardImg(pathImg: 'assets/images/beach_palm.jpeg', iconData: Icons.favorite_border, height: 250.0, width: 350.0, left: 20.0),
            CardImg(pathImg: 'assets/images/mountain.jpeg', iconData: Icons.favorite_border, height: 250.0, width: 350.0, left: 20.0),
            CardImg(pathImg: 'assets/images/river.jpeg',iconData: Icons.favorite_border, height: 250.0, width: 350.0, left: 20.0),
            CardImg(pathImg: 'assets/images/sunset.jpeg', iconData: Icons.favorite_border, height: 250.0, width: 350.0, left: 20.0),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.generateList();
  }
}
