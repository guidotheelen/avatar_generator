library avatar_generator;

import 'package:flutter/material.dart';

import 'mirrored_tiles.dart';
import 'shape_grid.dart';
import 'tile_logic.dart';

class AvatarGenerator extends StatelessWidget {
  final String seed;
  final List<Color> colors;
  final bool mirroredHorizontally;
  final bool mirroredVertically;
  final int horizontalTileCount;
  final int verticalTileCount;

  const AvatarGenerator({
    super.key,
    required this.seed,
    this.colors = const <Color>[
      Colors.amber,
      Colors.blue,
    ],
    this.mirroredHorizontally = true,
    this.mirroredVertically = true,
    this.horizontalTileCount = 2,
    this.verticalTileCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    final logic = TileLogic(seed: seed);
    final amount = horizontalTileCount * verticalTileCount;
    final tile = ShapeGrid(
      horizontalTileCount: horizontalTileCount,
      verticalTileCount: verticalTileCount,
      randomNums: logic.randomNumbers(amount, Shape.values.length),
      colors: logic.randomColors(amount, colors),
    );

    return FittedBox(
      fit: BoxFit.contain,
      child: MirroredTiles(
        tile: tile,
        mirroredHorizontal: mirroredHorizontally,
        mirroredVertical: mirroredVertically,
      ),
    );
  }
}
