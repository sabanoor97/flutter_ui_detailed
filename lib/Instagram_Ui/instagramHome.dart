import 'package:flutter/material.dart';
import 'package:flutter_ui_detailed/instagram_ui/bottom_navigationbar.dart';
import 'package:flutter_ui_detailed/instagram_ui/insta_timeline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstagramHome extends StatelessWidget {
  final appbar = AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    //so the first thing in a row is named as leading
    leading: Icon(FontAwesomeIcons.instagram),
    //now we want the title
    title: Text("Instagram",
        style: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
        )),
    actions: [
      Padding(
        padding: EdgeInsets.all(12.0),
        child: Icon(FontAwesomeIcons.facebookMessenger),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar,
      body: InstaTimeline(),
      bottomNavigationBar:
          Container(height: 50.0, child: Align(child: BottomNavigation())),
    );
  }
}
