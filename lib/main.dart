import 'package:flutter/material.dart';
import 'package:mobile/Widget/Body/body_searchpokemon.dart';
import 'Widget/Appbar/appbar_bar.dart';
import 'Widget/Pokemon/list_pokemon_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: Scaffold(
        appBar: const Appbar(),
        body: Column(children: const <Widget>[
          SearchPokemons(),
          Expanded(child: ListPokeMonCard())
        ]),
        backgroundColor: const Color(0xffF7F7F7),
      ),
    );
  }
}
