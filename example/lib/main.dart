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
  ScrollController scrollController = ScrollController();

  double testWidth = 50.0;

  final testDuration = const Duration(seconds: 1);

  AnimationController? controller1;
  AnimationController? controller2;
  AnimationController? controller3;
  AnimationController? controller4;
  AnimationController? controller5;
  AnimationController? controller6;
  AnimationController? controller7;
  AnimationController? controller8;
  AnimationController? controller9;
  AnimationController? controller10;
  AnimationController? controller11;
  AnimationController? controller12;
  AnimationController? controller13;
  AnimationController? controller14;
  AnimationController? controller15;
  AnimationController? controller16;

  AnimationController? controllerOther;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
        Future.delayed(const Duration(milliseconds: 500), () {
          controllerOther?.forward();
        });
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TablePaddingRow(
                      name: Text('GrowIn : leftToRight'),
                      sample: GrowIn(
                        controller: (growController) => controller1 = growController,
                        direction: GrowDirection.leftToRight,
                        collapsed: false,
                        child: ColorBox(color: Colors.red),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowIn : rightToLeft'),
                      sample: GrowIn(
                        controller: (growController) => controller2 = growController,
                        direction: GrowDirection.rightToLeft,
                        collapsed: false,
                        child: ColorBox(color: Colors.orange),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowIn : topToBottom'),
                      sample: GrowIn(
                        controller: (growController) => controller3 = growController,
                        direction: GrowDirection.topToBottom,
                        collapsed: false,
                        child: ColorBox(color: Colors.green),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowIn : bottomToTop'),
                      sample: GrowIn(
                        controller: (growController) => controller4 = growController,
                        direction: GrowDirection.bottomToTop,
                        collapsed: false,
                        child: ColorBox(color: Colors.yellow),
                      )
                  ),
                  TableDivider(),
                  TablePaddingRow(
                      name: Text('GrowOut : leftToRight'),
                      sample: GrowOut(
                        controller: (growController) => controller5 = growController,
                        direction: GrowDirection.leftToRight,
                        collapsed: false,
                        child: ColorBox(color: Colors.red),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowOut : rightToLeft'),
                      sample: GrowOut(
                        controller: (growController) => controller6 = growController,
                        direction: GrowDirection.rightToLeft,
                        collapsed: false,
                        child: ColorBox(color: Colors.orange),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowOut : topToBottom'),
                      sample: GrowOut(
                        controller: (growController) => controller7 = growController,
                        direction: GrowDirection.topToBottom,
                        collapsed: false,
                        child: ColorBox(color: Colors.green),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowOut : bottomToTop'),
                      sample: GrowOut(
                        controller: (growController) => controller8 = growController,
                        direction: GrowDirection.bottomToTop,
                        collapsed: false,
                        child: ColorBox(color: Colors.yellow),
                      )
                  ),
                  TableDivider(),
                  //
                  // Fixed: true----------------------------------------
                  //
                  TablePaddingRow(
                      name: Text('GrowIn : leftToRight\nfixed:true'),
                      sample: GrowIn(
                        controller: (growController) => controller9 = growController,
                        direction: GrowDirection.leftToRight,
                        collapsed: false,
                        fixed: true,
                        child: ColorBox(color: Colors.red),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowIn : rightToLeft\nfixed:true'),
                      sample: GrowIn(
                        controller: (growController) => controller10 = growController,
                        direction: GrowDirection.rightToLeft,
                        collapsed: false,
                        fixed: true,
                        child: ColorBox(color: Colors.orange),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowIn : topToBottom\nfixed:true'),
                      sample: GrowIn(
                        controller: (growController) => controller11 = growController,
                        direction: GrowDirection.topToBottom,
                        collapsed: false,
                        fixed: true,
                        child: ColorBox(color: Colors.green),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowIn : bottomToTop\nfixed:true'),
                      sample: GrowIn(
                        controller: (growController) => controller12 = growController,
                        direction: GrowDirection.bottomToTop,
                        collapsed: false,
                        fixed: true,
                        child: ColorBox(color: Colors.yellow),
                      )
                  ),
                  TableDivider(),
                  // ----------------------------------------
                  TablePaddingRow(
                      name: Text('GrowOut : leftToRight\nfixed:true'),
                      sample: GrowOut(
                        controller: (growController) => controller13 = growController,
                        direction: GrowDirection.leftToRight,
                        collapsed: false,
                        fixed: true,
                        child: ColorBox(color: Colors.red),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowOut : rightToLeft\nfixed:true'),
                      sample: GrowOut(
                        controller: (growController) => controller14= growController,
                        direction: GrowDirection.rightToLeft,
                        collapsed: false,
                        fixed: true,
                        child: ColorBox(color: Colors.orange),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowOut : topToBottom\nfixed:true'),
                      sample: GrowOut(
                        controller: (growController) => controller15 = growController,
                        direction: GrowDirection.topToBottom,
                        collapsed: false,
                        fixed: true,
                        child: ColorBox(color: Colors.green),
                      )
                  ),
                  TablePaddingRow(
                      name: Text('GrowOut : bottomToTop\nfixed:true'),
                      sample: GrowOut(
                        controller: (growController) => controller16 = growController,
                        direction: GrowDirection.bottomToTop,
                        collapsed: false,
                        fixed: true,
                        child: ColorBox(color: Colors.yellow),
                      )
                  ),
                ],
              ),
              GrowIn(
                controller: (growController) => controllerOther = growController,
                direction: GrowDirection.topToBottom,
                autoStart: false,
                collapsed: false,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtherScreen(),));
                  },
                  child: Text('Move other screen'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller1?..reset()..forward();
          controller2?..reset()..forward();
          controller3?..reset()..forward();
          controller4?..reset()..forward();
          controller5?..reset()..forward();
          controller6?..reset()..forward();
          controller7?..reset()..forward();
          controller8?..reset()..forward();
          controller9?..reset()..forward();
          controller10?..reset()..forward();
          controller11?..reset()..forward();
          controller12?..reset()..forward();
          controller13?..reset()..forward();
          controller14?..reset()..forward();
          controller15?..reset()..forward();
          controller16?..reset()..forward();
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
      width: null,
      height: 80.0,
      child: Center(child: Text('Test Widget')),
    );
  }
}

class TablePaddingRow extends TableRow {
  TablePaddingRow({
    required Text name,
    required Widget sample,
  }):super(
    children: [
      Padding(
        padding: EdgeInsets.all(12.0),
        child: FittedBox(child: name),
      ),
      Padding(
        padding: EdgeInsets.zero,
        child: sample,
      )
    ]
  );
}

class TableDivider extends TableRow {
  TableDivider():super(
    children: List.generate(2, (index) => Container(
      height: 20.0,
      color: Colors.grey,
    ),)
  );
}


/// Why `collapsed` parameter is exist
///
class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  AnimationController? topController;
  AnimationController? bottomController;

  bool isVertical = true;

  @override
  void dispose() {
    topController?.dispose();
    bottomController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collapsed Demo'),
      ),
      body: Center(
        child: isVertical ? verticalTestWidget : horizontalTestWidget,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 12.0,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              setState(() {
                isVertical = !isVertical;
              });
            },
            child: isVertical ? Icon(Icons.swap_horizontal_circle_outlined) : Icon(Icons.swap_vert_circle_outlined),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              topController?..reset()..forward();
              bottomController?..reset()..forward();
            },
            child: Icon(Icons.play_circle_outline_outlined),
          )
        ],
      ),
    );
  }

  Widget get verticalTestWidget => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                child: Column(
                  children: [
                    ColorBox(color: Colors.red),
                    GrowIn(
                      controller: (growController) => topController = growController,
                      direction: GrowDirection.topToBottom,
                      child: ColorBox(color: Colors.blue),
                    ),
                    ColorBox(color: Colors.orange),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                child: Column(
                  children: [
                    ColorBox(color: Colors.red),
                    GrowIn(
                      controller: (growController) => bottomController = growController,
                      direction: GrowDirection.topToBottom,
                      collapsed: false,
                      child: ColorBox(color: Colors.blue),
                    ),
                    ColorBox(color: Colors.orange),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );

  Widget get horizontalTestWidget => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      children: [
                        ColorBox(color: Colors.red),
                        GrowIn(
                          controller: (growController) => topController = growController,
                          direction: GrowDirection.leftToRight,
                          child: ColorBox(color: Colors.blue),
                        ),
                        ColorBox(color: Colors.orange),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                child: Row(
                  children: [
                    ColorBox(color: Colors.red),
                    GrowIn(
                      controller: (growController) => bottomController = growController,
                      direction: GrowDirection.leftToRight,
                      collapsed: false,
                      child: ColorBox(color: Colors.blue),
                    ),
                    ColorBox(color: Colors.orange),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
