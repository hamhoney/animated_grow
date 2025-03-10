import 'package:animated_grow/animated_grow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AnimatedGrow Demo',
      theme: ThemeData(
        // This is the theme of your
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
      ),
      home: const MyHomePage(title: 'AnimatedGrow Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AnimationController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.yellow.withAlpha(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                AnimatedGrow(
                  controller: (gc) => controller = gc,
                  child: Container(
                    color: Colors.red,
                    width: 200,
                    height: 60,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller?.forward();
        },
        child: const Icon(Icons.play_circle_outline),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
