import 'package:flutter/material.dart';

import 'tile_logic.dart';

class ShapeGrid extends StatelessWidget {
  final int horizontalTileCount;
  final int verticalTileCount;
  final List<Color> colors;
  final List<int> randomNums;
  final List<Shape> shapes;

  const ShapeGrid({
    Key? key,
    required this.horizontalTileCount,
    required this.verticalTileCount,
    required this.colors,
    required this.randomNums,
    required this.shapes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        verticalTileCount,
        (yIndex) => Row(
          children: List.generate(
            horizontalTileCount,
            (xIndex) {
              final index = yIndex * horizontalTileCount + xIndex;
              final color = colors[index];
              return Container(
                width: TileLogic.shapeSize,
                height: TileLogic.shapeSize,
                decoration: BoxDecoration(
                  borderRadius: shapes[randomNums[index]].value,
                  color: color,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
