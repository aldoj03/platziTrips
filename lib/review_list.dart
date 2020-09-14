import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  int reviewsNumber;

  ReviewList(this.reviewsNumber);

  @override
  Widget build(BuildContext context) {
    final List<Widget> comments = new List<Widget>();
    for (var i = 0; i < this.reviewsNumber; i++) {
      comments.add(
        Review('assets/images/people.jpg', 'User', '4 photos 1 comment',
            'Exelente Lugar.'),
      );
    }
    return Container(
        margin: EdgeInsets.only(top: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All comments',
              textAlign: TextAlign.center,
            ),
            ...comments
          ],
        ));
  }
}
