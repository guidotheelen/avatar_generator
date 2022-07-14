import 'package:flutter/material.dart';

import 'tile_logic.dart';

class ShapeGrid extends StatelessWidget {
  final int horizontalTileCount;
  final int verticalTileCount;
  final List<Color> colors;
  final List<int> randomNums;
  final double tilePadding;

  const ShapeGrid({
    super.key,
    required this.horizontalTileCount,
    required this.verticalTileCount,
    required this.colors,
    required this.randomNums,
    required this.tilePadding,
  });

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
              return Padding(
                padding: EdgeInsets.all(tilePadding),
                child: Container(
                  width: TileLogic.shapeSize,
                  height: TileLogic.shapeSize,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: color,
                      width: 1.0,
                    ),
                    borderRadius: Shape.values[randomNums[index]].value,
                    color: color,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
