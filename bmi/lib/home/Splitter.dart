import 'package:flutter/material.dart';

class Splitter extends StatelessWidget {
  final double height, width;
  final Color color;

  Splitter({
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
