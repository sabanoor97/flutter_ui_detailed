import 'package:flutter/material.dart';

class BoxOpacity extends StatefulWidget {
  @override
  _BoxOpacityState createState() => _BoxOpacityState();
}

class _BoxOpacityState extends State<BoxOpacity> {
  double opacity1 = 1.0, opacity2 = 1.0, opacity3 = 1.0;

  Widget _square(Color color) {
    return Container(
      height: 150,
      width: 150,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "A widget that makes its child partially transparent",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            GestureDetector(
              child: Opacity(
                opacity: opacity1,
                child: _square(Colors.blue),
              ),
              onTap: () {
                setState(() {
                  opacity1 = 1.0 - this.opacity1;
                });
              },
            ),
            GestureDetector(
              child: Opacity(
                opacity: opacity2,
                child: _square(Colors.purple),
              ),
              onTap: () {
                setState(() {
                  opacity2 = 1.0 - this.opacity2;
                });
              },
            ),
            GestureDetector(
              child: Opacity(
                opacity: opacity3,
                child: _square(Colors.indigo),
              ),
              onTap: () {
                setState(() {
                  opacity3 = 1.0 - this.opacity3;
                });
              },
            ),
            Text(
              "Opacity",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
