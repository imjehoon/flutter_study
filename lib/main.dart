import 'package:flutter/material.dart'; // material 은 플루터를 모바일과 웹에서 사용하게 해준다.
import 'package:english_words/english_words.dart';
// 코드 우클릭 reformat code with dart fmt
/**
 * 별도 외부 라이브러리를 사용하고 싶을 경우
 * pubspect.yaml 에 추가후
 * cmd에서 flutter pub get명령어 실행 후 임포트해주고 사용하면 된다.
 *
 */
//void mian() => runApp(MyApp()); //
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget { // 상속 받음으로써 자기 자신을 위젯으로 사용하게 해준다. 플루터는 대부분 위젯으로 되어있고 포함한다.xxx
  @override
  Widget build(BuildContext context) { // 위젯의 메인 잡은 build() 메소드를 제공한다.,

    //final wordPair = WordPair.random();
    // TODO: implement build
    return MaterialApp(
        title: 'welcome flutter',
        home: RandomWords()
    );
  }
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('startup name genetator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){ // 홀수일경우 divider를 리턴하고 짝수일 경우 _suggestions변수에 단어를 add 한다.
        if( i.isOdd) return Divider();

        final index = i ~/ 2; // 2로나눈 몫을 리턴 1,2,3,4 -> 0,1,1,2
        if( index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

}



class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }

}
