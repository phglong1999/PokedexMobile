import 'package:flutter/material.dart';

class SearchPokemons extends StatelessWidget {
  const SearchPokemons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 48.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: const Color(0xffE0E0E0)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: IntrinsicWidth(
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
