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

  double testWidth = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('test Context Area'),
              GrowIn(
                controller: (gc) => controller = gc,
                direction: GrowDirection.bottomToTop,
                delay: Duration(seconds:3),
                collapsed: false,
                duration: const Duration(seconds: 1),
                reverseDuration: const Duration(milliseconds: 250),
                from: -20,
                child: ColorBox(color: Colors.red),
              ),
              GrowIn(
                direction: GrowDirection.leftToRight,
                collapsed: false,
                child: ColorBox(color: Colors.yellow),
              ),
              Text('test Text2')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('animation status:${controller!.status}');
          controller?.reset();
          if (controller != null && controller!.isCompleted) {
            controller?.reverse();
          } else {
            controller?.forward();
          }
          print('animation status:${controller!.status}');
        },
        child: const Icon(Icons.play_circle_outline),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({super.key, required this.color});

  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 150.0,
      height: 50.0,
      child: Center(child: Text('Test Widget')),
    );
  }
}
