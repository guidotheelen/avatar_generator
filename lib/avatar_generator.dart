library avatar_generator;

import 'package:flutter/material.dart';

import 'mirrored_tiles.dart';
import 'shape_grid.dart';
import 'tile_logic.dart';

class AvatarGenerator extends StatelessWidget {
  /// The seed used to generate the avatar
  final String seed;

  /// The colors used in the avatar
  final List<Color> colors;

  /// Mirror the selected tiles horizontally
  /// This doubles the number of tiles in the avatar
  final bool mirroredHorizontally;

  /// Mirror the selected tiles verically
  /// This doubles the number of tiles in the avatar
  final bool mirroredVertically;

  /// The number of horizontal tiles in the avatar
  final int horizontalTileCount;

  /// The number of vertical tiles in the avatar
  final int verticalTileCount;

  /// The padding between tiles
  final double tilePadding;

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
    this.tilePadding = 0,
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
      tilePadding: tilePadding,
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
