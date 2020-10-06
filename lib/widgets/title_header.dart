import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  double width = 0.0;
  TitleHeader({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width;

    return Text(this.title,
        style: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold));
  }
}
