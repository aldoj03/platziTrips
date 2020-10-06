import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({Key key, this.iconData, this.onPressed})
      : super(key: key);

  @override
  _FloatingActionButtonGreenState createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool tapped;

  @override
  void initState() {
    this.tapped = false;
  }

  // void onPressedFav() {
  //   setState(() {
  //     this.tapped = !this.tapped;
  //   });
  //   Scaffold.of(context).showSnackBar(SnackBar(
  //     content: Text('Favorito'),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: 'Fav',
      onPressed: widget.onPressed,
      child: Icon(widget.iconData),
    );
  }
}
