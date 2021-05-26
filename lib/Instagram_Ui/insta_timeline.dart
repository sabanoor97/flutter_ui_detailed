import 'package:flutter/material.dart';
import 'package:flutter_ui_detailed/instagram_ui/timeline_list.dart';

class InstaTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Flexible(child: IgTimelineList()),
      ],
    );
  }
}
