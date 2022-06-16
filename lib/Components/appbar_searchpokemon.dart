import 'package:flutter/material.dart';

class SearchPokemon extends StatelessWidget implements PreferredSizeWidget {
  const SearchPokemon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xf6666666)),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder()),
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: Color(0xf6666666)));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
