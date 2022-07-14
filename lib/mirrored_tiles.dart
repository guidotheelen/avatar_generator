import 'dart:math';

import 'package:flutter/material.dart';

class MirroredTiles extends StatelessWidget {
  final Widget tile;
  final bool mirroredHorizontal;
  final bool mirroredVertical;

  const MirroredTiles({
    Key? key,
    required this.tile,
    required this.mirroredHorizontal,
    required this.mirroredVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            tile,
            if (mirroredVertical)
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: tile,
              ),
          ],
        ),
        if (mirroredHorizontal)
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(pi),
            child: Row(
              children: [
                tile,
                if (mirroredVertical)
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: tile,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
