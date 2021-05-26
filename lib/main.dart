import 'package:flutter/material.dart';
import 'package:flutter_ui_detailed/Color_Picker_Types/Color_Picker.dart';
import 'package:flutter_ui_detailed/Painting/painter_page.dart';
import 'package:flutter_ui_detailed/Pedometer/step_counter.dart';
import 'package:flutter_ui_detailed/Types_of_Dialogs/all_dialogs.dart';
import 'package:hive/hive.dart';

void main() async {
  runApp(MyApp());
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.openBox<int>('steps');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Instagram",
      //this will remove the banner on top right side
      debugShowCheckedModeBanner: false,
      //adding theme
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
            headline1: TextStyle(color: Colors.black),
          ),
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black),
          )),
      home: PainterPage(),
    );
  }
}
