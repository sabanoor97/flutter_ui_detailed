import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListDetail extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ListDetail> {
  final List<WordPair> _words = <WordPair>[];
  final _saved = Set<WordPair>();

  Widget _infiniteScrollingListView() {
    return ListView.builder(itemBuilder: (context, int i) {
      if (i.isOdd) {
        return Divider();
      }
      final index = i ~/ 2;
      if (index >= _words.length) {
        _words.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_words[index]);
    });
  }

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);

    return ListTile(
      title: Text(wordPair.asPascalCase),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List"),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _infiniteScrollingListView(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      // Add lines from here...
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
