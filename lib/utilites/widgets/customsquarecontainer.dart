import 'package:flutter/material.dart';

class customsquarecontainer extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color color;

  const customsquarecontainer({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 2, color: Colors.grey.withOpacity(.4))),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
