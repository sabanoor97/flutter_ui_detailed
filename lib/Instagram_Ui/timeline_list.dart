import 'package:flutter/material.dart';
import 'package:flutter_ui_detailed/instagram_ui/insta_story.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IgTimelineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) => index == 0
            ? new SizedBox(
                child: InstaStories(),
                height: deviceSize.height * 0.19,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //1st row
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ'),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Saba Noor"),
                          ],
                        ),
                        IconButton(
                            icon: Icon(Icons.more_vert_sharp), onPressed: null),
                      ],
                    ),
                  ),

                  //2nd row
                  Flexible(
                      fit: FlexFit.loose,
                      child: Image.network(
                        'https://i.picsum.photos/id/1078/3000/2000.jpg?hmac=kI-4ittyvRAG5-z9urHPPBQ4kDNJ4ItiEw6-NagOy10',
                        fit: BoxFit.cover,
                      )),

                  //3rd row
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(FontAwesomeIcons.heart),
                            SizedBox(
                              width: 16,
                            ),
                            Icon(FontAwesomeIcons.comment),
                            SizedBox(
                              width: 16,
                            ),
                            Icon(FontAwesomeIcons.paperPlane),
                            SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        Icon(FontAwesomeIcons.bookmark),
                      ],
                    ),
                  ),
                  //4th row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Liked by Nargisi Kofta, Aasma and 547,432 others",
                    ),
                  ),
                  //5th row
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ'),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment....",
                          ),
                        ))
                      ],
                    ),
                  ),
                  //6th row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "10 sec ago",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ));
  }
}
