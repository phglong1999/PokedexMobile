// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile/Extension/extension.dart';
import '../../Models/pokemon.dart';

class PokeMonCard extends StatefulWidget {
  const PokeMonCard({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  @override
  State<StatefulWidget> createState() => _PokeMonCardState();
}

class _PokeMonCardState extends State<PokeMonCard> {
  static const Map<String, String> mapColor = {
    "electric": "0xfff9cf30",
    "water": "0xff6493eb",
    "ghost": "0xff70559b",
    "fire": "0xfff57d31",
    "bug": "0xffa7b723",
    "normal": "0xffaaa67f",
    "steel": "0xffb7b9d0",
    "rock": "0xffb69e31",
    "fairy": "0xffe69eac",
    "ice": "0xff9ad6df",
    "dark": "0xff75574c",
    "grass": "0xff74cb48",
    "psychic": "0xfffb5584",
    "ground": "0xffdec16b",
    "dragon": "0xff7037ff",
    "poison": "0xffa43e9e",
    "flying": "0xffa891ec",
    "fighting": "0xffc12239"
  };
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color(
                    mapColor[widget.pokemon.types[0].name]!.getHexValue())),
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                    margin: EdgeInsets.only(right: 10, top: 5),
                    child: Text(
                      "#${widget.pokemon.id}",
                      style: TextStyle(
                          color: Color(mapColor[widget.pokemon.types[0].name]!
                              .getHexValue())),
                      textAlign: TextAlign.right,
                    ))),
            Expanded(
              child: Image(
                image: NetworkImage(widget
                    .pokemon.sprites.other.official_artwork.front_default),
              ),
            ),
            Container(
              color:
                  Color(mapColor[widget.pokemon.types[0].name]!.getHexValue()),
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.pokemon.name.capitalize(),
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
