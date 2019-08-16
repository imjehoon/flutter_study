import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 18 왜 이건 깃에 안가지?dsdg
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup name generator',
      home: new RandomWords (),
      theme: new ThemeData(
        primaryColor: Colors.purple
      ),
    );

  }

}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize:  18.0);

  @override
  Widget build(BuildContext context) {
    //final WordPair wordPair = new WordPair.random();
    //return new Text(wordPair.asPascalCase);
    
    return new Scaffold(
      appBar: new AppBar(
        title:  new Text('startup name generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
        backgroundColor: Colors.purple,
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
          builder: (BuildContext context){
            final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair){
                  return new ListTile(
                    title:  new Text(
                      pair.asPascalCase, style: _biggerFont,
                    ),
                  );
                }
            );

            final List<Widget> divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList();

            return new Scaffold(
              appBar: new AppBar(
                title:  const Text("saved"),
              ),
              body: new ListView(children: divided),
            );
      })
    );
  }

  Widget _buildSuggestions() {
//   final WordPair wordPair = new WordPair.random();
//   return new Text(wordPair.asPascalCase);
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i){

        if(i.isOdd) {
          return new Divider();
        }

        // TODO 음 이게 무슨말인지...잘모르겠네....
        final int index = i ~/2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {

    final bool alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.purple : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

