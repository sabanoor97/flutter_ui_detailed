import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.home), iconSize: 30, onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.search), iconSize: 30, onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.add_box), iconSize: 30, onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  iconSize: 30,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.person), iconSize: 30, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
