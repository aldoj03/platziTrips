import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  String pathImage;
  String userName;
  String details;
  String comment;

  Review(this.pathImage, this.userName, this.details, this.comment);

  @override
  Widget build(BuildContext context) {
    final userInfo = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(this.details,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 13.0, color: Color(0xFFa3a5a7))),
    );

    final userName = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(this.userName,
          textAlign: TextAlign.left, style: TextStyle(fontSize: 17.0)),
    );

    final userComment = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(this.comment,
          softWrap: true,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16.0, color: Color(0xFF030303))),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[userName, userInfo, userComment],
    );

    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      child: CircleAvatar(
        backgroundImage: AssetImage(this.pathImage),
      ),
      // decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     image: DecorationImage(
      //         fit: BoxFit.cover, image: AssetImage(this.pathImage))),
    );

    return Row(
      children: <Widget>[photo, userDetails],
    );
  }
}
