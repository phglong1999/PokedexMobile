// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/Models/pokemon.dart';

extension HexString on String {
  int getHexValue() => int.parse(this);
}

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
    var color = {"electric": "0xffF57D31"};
    var x = color["electric"]!.getHexValue();
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1),
        itemCount: 50,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
              margin: const EdgeInsets.only(
                  left: 15, top: 10, bottom: 10, right: 15),
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "#25",
                        style: TextStyle(
                          color: Color(x),
                        ),
                        textAlign: TextAlign.left,
                      )),
                  const Expanded(
                    child: Image(
                      image: NetworkImage(
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"),
                    ),
                  ),
                ],
              ));
        });
  }
}
