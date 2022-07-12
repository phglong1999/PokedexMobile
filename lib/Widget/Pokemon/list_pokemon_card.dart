// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/Models/pokemon.dart';
import 'dart:convert';

import 'package:mobile/Widget/Pokemon/pokemon_card.dart';

import '../../Models/list_pokemon.dart';

extension HexString on String {
  int getHexValue() => int.parse(this);
}

class ListPokeMonCard extends StatefulWidget {
  const ListPokeMonCard({Key? key, this.color = const Color(0xffF9CF30)})
      : super(key: key);
  final Color color;

  @override
  State<StatefulWidget> createState() => _ListPokeMonCardState();
}

class _ListPokeMonCardState extends State<ListPokeMonCard> {
  // ScrollController _scrollController = ScrollController();
  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       //Check whether user scrolled to last position
  //       if (shouldLoadMore) {
  //         setState(() {
  //           skip += ordersList.length;
  //           future = getAllOrders(skip); //load more data
  //         });
  //       }
  //     }
  //   });
  // }
  Future<Pokemon> getListPokemon() async {
    // var response = await http.get(
    //     Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0'));
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/50'));

    if (response.statusCode == 200) {
      // final pokemons = jsonDecode(response.body);
      // pokemons["results"].forEach( (item)=> {
      //   response = await getPokemon(item["url"]);
      // });
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemon');
    }
  }

  Future<Pokemon> getPokemon(url) async {
    var response = await http.get(Uri.parse(url));
    // final response =
    //     await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/50'));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemon');
    }
  }

  late Future<Pokemon> pokemon;

  @override
  void initState() {
    super.initState();
    pokemon = getListPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon>(
        future: pokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                // controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                itemCount: 25,
                itemBuilder: (BuildContext ctx, index) {
                  return PokeMonCard(
                    pokemon: snapshot.data!,
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
}
