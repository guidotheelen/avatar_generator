import 'package:avatar_generator/avatar_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AvatarGeneratorApp());
}

class AvatarGeneratorApp extends StatelessWidget {
  const AvatarGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _size = 300.0;

  var seed = ValueNotifier('1234567890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: _size,
              height: _size,
              child: ValueListenableBuilder<String>(
                valueListenable: seed,
                builder: (_, value, __) => AvatarGenerator(
                  seed: value,
                  colors: [Colors.green, Colors.black87],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: _size,
              child: TextField(
                textAlign: TextAlign.center,
                controller: TextEditingController(text: seed.value),
                onChanged: (value) {
                  seed.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
