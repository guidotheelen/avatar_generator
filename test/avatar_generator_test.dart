import 'package:avatar_generator/shape_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:avatar_generator/avatar_generator.dart';

void main() {
  late Widget avatarGenerator;

  group('$AvatarGenerator', () {
    setUp(() {
      avatarGenerator = const MaterialApp(
        home: Material(
          child: AvatarGenerator(
            seed: 'flutter',
          ),
        ),
      );
    });

    testWidgets('renders containers by default', (WidgetTester tester) async {
      await tester.pumpWidget(avatarGenerator);

      expect(find.byType(Container), findsNWidgets(16));
    });

    testWidgets('renders shapegrids by default', (WidgetTester tester) async {
      await tester.pumpWidget(avatarGenerator);

      expect(find.byType(ShapeGrid), findsNWidgets(4));
    });

    testWidgets('shows default colors', (WidgetTester tester) async {
      await tester.pumpWidget(avatarGenerator);

      expect(_tileBackgroundColor(tester), anyOf(Colors.amber, Colors.blue));
    });

    testWidgets('scales to parent size', (WidgetTester tester) async {
      await tester.pumpWidget(avatarGenerator);

      expect(
        find.byType(AvatarGenerator).evaluate().first.size?.width,
        find.byType(Material).evaluate().first.size?.width,
      );
    });

    testWidgets('does not break with empty seed', (WidgetTester tester) async {
      avatarGenerator = const MaterialApp(
        home: Material(
          child: AvatarGenerator(
            seed: '',
          ),
        ),
      );
      await tester.pumpWidget(avatarGenerator);

      expect(find.byType(Container), findsNWidgets(16));
    });

    testWidgets('shows unmirrored tiles', (WidgetTester tester) async {
      avatarGenerator = const MaterialApp(
        home: Material(
          child: AvatarGenerator(
            seed: 'Flutter',
            verticalTileCount: 3,
            horizontalTileCount: 3,
            mirroredHorizontally: false,
            mirroredVertically: false,
          ),
        ),
      );
      await tester.pumpWidget(avatarGenerator);

      expect(find.byType(Container), findsNWidgets(9));
    });
  });
}

Color _tileBackgroundColor(WidgetTester tester) {
  final containerFound = find.byType(Container).first;
  final container = tester.widget<Container>(containerFound);
  final decoration = container.decoration as BoxDecoration;
  final color = decoration.color as Color;
  return color;
}
