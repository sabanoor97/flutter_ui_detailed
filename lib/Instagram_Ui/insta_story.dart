import 'package:flutter/material.dart';

class InstaStories extends StatelessWidget {
  final topTitles = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Stories",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          Icon(Icons.play_arrow),
          Text(
            "Watch All",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      )
    ],
  );

  final stories = Expanded(
      child: Padding(
    padding: const EdgeInsets.only(top: 2.0),
    child: ListView.builder(
        itemCount: 35,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ'),
                      )),
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                ),
                index == 0
                    ? Positioned(
                       right: 10.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: 10,
                          child: Icon(Icons.add, size: 14, color: Colors.white),
                        ))
                    : Container()
              ],
            )),
  ));

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          topTitles,
          stories,
        ],
      ),
    );
  }
}
