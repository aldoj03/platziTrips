import 'package:flutter/material.dart';
import 'package:flutter__trips/profile.dart';
import 'package:flutter__trips/search_trips.dart';
import 'home_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  _PlatziTripsState createState() => _PlatziTripsState();
}

class _PlatziTripsState extends State<PlatziTrips> {
  int indexWidget;
  final List<Widget> widgetsCHildren = [Home(), SearchTrips(), ProfileTrips()];

  @override
  void initState() {
    this.indexWidget = 0;
  }

  void onTapTapped(int index) {
    setState(() {
      this.indexWidget = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.widgetsCHildren[this.indexWidget],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white, primaryColor: Color(0xFF4268D3)),
        child: BottomNavigationBar(
          onTap: this.onTapTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('')),
          ],
        ),
      ),
    );
  }
}
