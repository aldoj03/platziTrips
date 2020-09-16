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
            CardImg('assets/images/mountain_stars.jpeg'),
            CardImg('assets/images/beach_palm.jpeg'),
            CardImg('assets/images/mountain.jpeg'),
            CardImg('assets/images/river.jpeg'),
            CardImg('assets/images/sunset.jpeg'),
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
