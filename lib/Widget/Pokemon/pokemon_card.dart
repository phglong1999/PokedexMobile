// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Models/list_pokemon.dart';
import '../../Models/pokemon.dart';

extension HexString on String {
  int getHexValue() => int.parse(this);
}

class PokeMonCard extends StatefulWidget {
  const PokeMonCard({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  @override
  State<StatefulWidget> createState() => _PokeMonCardState();
}

class _PokeMonCardState extends State<PokeMonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: Color(widget.pokemon.name.getHexValue()))),
        margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.pokemon.name,
                  style: TextStyle(
                    color: Color(widget.pokemon.name.getHexValue()),
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
  }
}
