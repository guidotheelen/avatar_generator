import 'dart:math' show Random;

import 'package:flutter/material.dart';

class TileLogic {
  static const shapeSize = 20.0;

  final String seed;

  int get seedToInt =>
      ' $seed'.codeUnits.reduce((value, element) => value + element);

  TileLogic({
    required this.seed,
  });

  List<Color> randomColors(int count, List<Color> colors) => List.generate(
      count, (i) => colors[Random(seedToInt + i).nextInt(colors.length)]);

  List<int> randomNumbers(int count, int max) =>
      List.generate(count, (i) => Random(seedToInt + i).nextInt(max));
}

enum Shape {
  roundedCornerTopLeft(
    BorderRadius.only(
      topLeft: Radius.circular(
        TileLogic.shapeSize,
      ),
    ),
  ),
  roundedCornerTopRight(
    BorderRadius.only(
      topRight: Radius.circular(
        TileLogic.shapeSize,
      ),
    ),
  ),
  roundedCornerBottomLeft(
    BorderRadius.only(
      bottomLeft: Radius.circular(
        TileLogic.shapeSize,
      ),
    ),
  ),
  roundedCornerBottomRight(
    BorderRadius.only(
      bottomRight: Radius.circular(
        TileLogic.shapeSize,
      ),
    ),
  ),
  roundedCornerAll(
    BorderRadius.all(
      Radius.circular(
        TileLogic.shapeSize,
      ),
    ),
  );

  const Shape(this.value);

  final BorderRadius value;
}
