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
        home: Scaffold( // scaffold 위젯은 material 라이브러리에 속해있다. 제공한다 기본 앱바, 타이틀 그리고 버디속성을, 화면에 위젯 트리를 고정시켜준다.
          appBar: AppBar(title: Text('welcome to flutter')),
          body: Center(
            //child: Text(wordPair.asPascalCase),
            child: RandomWords(),
          ),
        ));
  }
}

class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }

}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }

}
