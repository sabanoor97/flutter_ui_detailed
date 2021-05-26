import 'package:flutter/material.dart';

class ScrollLikeWheel extends StatefulWidget {
  @override
  _ScrollLikeWheelState createState() => _ScrollLikeWheelState();
}

class _ScrollLikeWheelState extends State<ScrollLikeWheel> {
 int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      ListTile(
        leading: Icon(Icons.local_activity, size: 40, color: Colors.deepPurple),
        title: Text("Activity"),
        subtitle: Text("Activity status!"),
      ),
      ListTile(
        leading: Icon(Icons.favorite_sharp, size: 40, color: Colors.deepPurple),
        title: Text("Likes"),
        subtitle: Text("Liked by saba & 200 others"),
      ),
      ListTile(
        leading: Icon(Icons.airplanemode_active_outlined,
            size: 40, color: Colors.deepPurple),
        title: Text("Airplane mode"),
        subtitle: Text("On"),
      ),
      ListTile(
        leading: Icon(Icons.access_alarms, size: 40, color: Colors.deepPurple),
        title: Text("Alarm"),
        subtitle: Text("7:30 pm"),
      ),
      ListTile(
        leading: Icon(Icons.accessibility, size: 40, color: Colors.deepPurple),
        title: Text("Accessiblity"),
        subtitle: Text("Developer option"),
      ),
      ListTile(
        leading: Icon(Icons.zoom_in, size: 40, color: Colors.deepPurple),
        title: Text("Zoom in"),
        subtitle: Text("70%"),
      ),
      ListTile(
        leading: Icon(Icons.zoom_out, size: 40, color: Colors.deepPurple),
        title: Text("Zoom out"),
        subtitle: Text("30%"),
      ),
      ListTile(
        leading: Icon(
          Icons.location_on,
          color: Colors.deepPurple,
          size: 40,
        ),
        title: Text("Location"),
        subtitle: Text("Lahore"),
      ),
      ListTile(
        leading: Icon(Icons.wifi_rounded, size: 40, color: Colors.deepPurple),
        title: Text("Wifi"),
        subtitle: Text("On"),
      ),
      ListTile(
        leading: Icon(Icons.west_outlined, size: 40, color: Colors.deepPurple),
        title: Text("Back"),
        subtitle: Text("No activity found"),
      ),
      ListTile(
        leading: Icon(Icons.cake_sharp, size: 40, color: Colors.deepPurple),
        title: Text("Event"),
        subtitle: Text("Tommorrow is ur birthday"),
      ),
      ListTile(
        leading:
            Icon(Icons.calculate_sharp, size: 40, color: Colors.deepPurple),
        title: Text("Calculater"),
        subtitle: Text("Last calculation is: 8000"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scroll like wheel!"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.deepPurple[200],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListWheelScrollView(
              itemExtent: 70,
              children: items,
              magnification: 1.5,
              useMagnifier: true,
              physics: FixedExtentScrollPhysics(),
              diameterRatio: 1.5,
              squeeze: 1,
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedItemIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
