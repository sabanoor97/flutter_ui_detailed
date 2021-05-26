import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui_detailed/Json_Parsing/posts.dart';
import 'package:http/http.dart';

class JsonParsingComplex extends StatefulWidget {
  @override
  _JsonParsingComplexState createState() => _JsonParsingComplexState();
}

class _JsonParsingComplexState extends State<JsonParsingComplex> {
  Future<PostList> data;
  Network network = Network("https://jsonplaceholder.typicode.com/posts");

  @override
  void initState() {
    super.initState();

    data = network
        .fetchAllPosts(); //now we have all the data now we can seet it to widgets
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Json parsing using PODO"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<PostList> snapshot) {
                List<Post> alldata;
                if (snapshot.hasData) {
                  alldata = snapshot.data.allPosts;
                  return cresteListView(context, alldata);
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }

  Widget cresteListView(BuildContext context, List<Post> data) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 5,
                ),
                ListTile(
                  title: Text("${data[index].title}"),
                  subtitle: Text("${data[index].body}"),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 25,
                        child: Text(
                          "${data[index].id}",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

class Network {
  //responsiblity of this class is to go & fetch data from our URL
  //https://jsonplaceholder.typicode.com/posts

  final String url;

  Network(this.url);

  Future<PostList> fetchAllPosts() async {
    Response response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      //ok
      return PostList.fromJson(jsonDecode(response
          .body)); //as we knoe response body gives ua a list of json objects and the method we created earlier as postlist wants a list so we pass response of json objects list as postlist
    } else {
      throw Exception("Can't load posts from json");
    }
  }
}
