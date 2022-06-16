import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'Components/appbar_bar.dart';
import 'Components/appbar_searchpokemon.dart';
import 'Widget/pokemon_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: const Appbar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            const SearchPokemon(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [PokeMonCard(), PokeMonCard(), PokeMonCard()]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [PokeMonCard(), PokeMonCard(), PokeMonCard()]),
          ]),
        ),
        backgroundColor: const Color(0xffF7F7F7),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}
