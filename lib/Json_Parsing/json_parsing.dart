import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future data; //everything that network class is return were save in data

  @override
  void initState() {
    super.initState();
    //data = Network("https://jsonplaceholder.typicode.com/posts").fetchData();         //it is the 1st method other is under the build
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json parsing"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              //when we use future builder we use this condition to check whether any data available or not

              //for all the item in  json array we use listview

              return setDataToListView(context, snapshot.data);

              /* this code is for single text
              return Text(snapshot.data[0]['title'][
                      'userid'] //tostring method is used to convert string into int
                  .toString()); //the result is as same as below comment code but the difference is now data is showing on mobile screen
   */

            }
            return CircularProgressIndicator();
          }),
        ),
      ),
    );
  }

  //outside the build method
  //another method of fetching data
  Future getData() async {
    var data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);
    data = network.fetchData();
/*
    //data is shown on debugger
    //print the list
    data.then((value) => print(
        value)); //use to print future(whatever we r hoping to recieve in background)
    //or u can also print some of the fields like
    data.then((value) => print(value[4]['title']));
*/
    return data;
  }

  Widget setDataToListView(BuildContext context, List data) {
    return Container(
      child: ListView.builder(itemBuilder: (context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("${data[index]["title"]}"),
              subtitle: Text("${data[index]["body"]}"),
              leading: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Text(data[index]['id']),
                    radius: 23,
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

  Future fetchData() async {
    print("$url");

    Response response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      //ok
      //print(response.body[0]);
      //body takes the string where as the json response is an array so, encode in json to print the list
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
