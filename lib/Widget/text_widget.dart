import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      this.fontFamily = "Poppins",
      this.value = "",
      this.fontWeight = FontWeight.normal,
      this.fontSize = 12,
      this.color = Colors.black})
      : super(key: key);
  final String value;
  final String fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(value,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily));
  }
}
