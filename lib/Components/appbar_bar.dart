import 'package:flutter/material.dart';

import '../Widget/text_widget.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset("assets/appIcon.png"),
      title: const TextWidget(
          value: "POKEDEX",
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Color(0xff212121)),
      backgroundColor: const Color(0xffF7F7F7),
      actions: const [
        Center(
            child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: TextWidget(
                  value: "#",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff212121),
                )))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
