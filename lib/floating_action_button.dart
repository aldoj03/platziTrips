import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  FloatingActionButtonGreen({Key key}) : super(key: key);

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

  void OnPressedFav() {
    setState(() {
      this.tapped = !this.tapped;
    });
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Favorito'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: 'Fav',
      onPressed: this.OnPressedFav,
      child: Icon(this.tapped == true ? Icons.favorite : Icons.favorite_border),
    );
  }
}
