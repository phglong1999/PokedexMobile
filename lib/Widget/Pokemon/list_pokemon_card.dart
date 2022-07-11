// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/Widget/Pokemon/pokemon_card.dart';

import '../../Models/list_pokemon.dart';

extension HexString on String {
  int getHexValue() => int.parse(this);
}

Future<ListPokemon> getListPokemon() async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=25&limit=25'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ListPokemon.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load pokemon');
  }
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album> GridView.builder(
        // controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1),
        itemCount: 25,
        itemBuilder: (BuildContext ctx, index) {
          return PokeMonCard(
            pokemon: widget.color,
          );
        });
  }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
}
