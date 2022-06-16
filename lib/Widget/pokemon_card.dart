// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/Models/pokemon.dart';

Future<Pokemon> getListPokemon() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/25'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class PokeMonCard extends StatelessWidget {
  const PokeMonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: const RoundedRectangleBorder(
          side: BorderSide(width: 1.0, color: Color(0xffF9CF30))),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3 - 16,
            child: Column(children: [
              Text(
                "#25",
                style: TextStyle(
                  color: Color(0xffF9CF30),
                ),
                textAlign: TextAlign.left,
              ),
              const Image(
                image: NetworkImage(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"),
              ),
              Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "#25",
                  style: TextStyle(
                    color: Color(0xffF9CF30),
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
