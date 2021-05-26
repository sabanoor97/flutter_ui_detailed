import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///F:/Dart/FlutterCourseCoding/movieapp_flutter_listview/lib/movies_dispay/movieslist.dart';

class Movies extends StatelessWidget {
  //importing the list of movies from moviesList class
  final List<MoviesList> moviesLists = MoviesList.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: moviesLists.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(moviesLists[index], context),
              Positioned(
                  top: 10.0, child: imageCard(moviesLists[index].images[0]))
            ]);
          }),
    );
  }

  Widget movieCard(MoviesList moviesList, BuildContext context) {
    return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 60.0),
          height: 120.0,
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              moviesList.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18.0,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            "Rating: ${moviesList.imdbRating}/10",
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                              child: Text(
                            "Released: ${moviesList.released}",
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.white),
                          )),
                          Text(
                            moviesList.runtime,
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.white),
                          ),
                          Text(
                            moviesList.country,
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        onTap: () => Navigator.push(
            context, //to go to second route
            MaterialPageRoute(
                builder: (context) => Moviedetails(
                      movieName: moviesList.title,
                      moviesList: moviesList,
                    ))));
  }

  Widget imageCard(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imageUrl ??
                'https://directories4u.files.wordpress.com/2014/11/5.png'),
            //adding link after ?? defines that if the imageUrl doesnot work for some reason then deafult image is appeared
            fit: BoxFit.cover,
          )),
    );
  }
}

//new route
class Moviedetails extends StatelessWidget {
  final String movieName;
  final MoviesList moviesList;

  const Moviedetails({Key key, this.movieName, this.moviesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Flexible(child: Text("Movie Details")),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: moviesList.images[0]),
          MovieDetailHeaderWithPoster(moviesListPoster: moviesList),
          MovieExtraPoster(posters: moviesList.images)
        ],
      ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(thumbnail), fit: BoxFit.fill)),
          ),
          Icon(
            Icons.play_circle_outline,
            size: 100,
            color: Colors.white,
          )
        ],
      ),
      // Container(
      //   decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //           colors: [Colors.white, Colors.black12],
      //           begin: Alignment.topCenter,
      //           end: Alignment.bottomCenter)),
      //   height: 80,
      // )
    ]);
  }
}

class MovieDetailHeaderWithPoster extends StatelessWidget {
  final MoviesList moviesListPoster;

  const MovieDetailHeaderWithPoster({Key key, this.moviesListPoster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: moviesListPoster.images[0].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: MovieDetailHeader(
            movie: moviesListPoster,
          ))
          //tostring here is to tell that we are using imae url which is in string
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailHeader extends StatelessWidget {
  final MoviesList movie;

  const MovieDetailHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${movie.year}, ${movie.country}".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.cyan)),
        Text(movie.title,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 32, color: Colors.cyan)),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(text: movie.genre),
              TextSpan(
                  text: " More....",
                  style: TextStyle(color: Colors.indigoAccent)),
            ])),
      ],
    );
  }
}

class MovieExtraPoster extends StatelessWidget {
  final List<String> posters;

  const MovieExtraPoster({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            " More Movie Posters...".toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.black26),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Container(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: 8,
                    ),
                itemCount: posters.length,
                itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(posters[index]),
                          fit: BoxFit.cover,
                        )),
                      ),
                    )),
          ),
        )
      ],
    );
  }
}
