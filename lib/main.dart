import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // We removed "const" here because the home page state is now fully dynamic
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  // REQUIREMENT 1: Use 'var' instead of 'int' or 'double', initialized to 0.0
  var _counter = 0.0;

  // REQUIREMENT 2: Declare myFontSize and initialize to 30.0
  double myFontSize = 30.0;

  // REQUIREMENT 3: Declare a private _myFontStyle variable using a TextStyle object
  // 'late' allows us to safely reference myFontSize during initialization
  late TextStyle _myFontStyle = TextStyle(fontSize: myFontSize);

  // REQUIREMENT 5: Create a private function _setNewValue() to update font size & text properties
  void _setNewValue(double newValue) {
    setState(() {
      _counter = newValue;      // Track slider value on the counter
      myFontSize = newValue;    // Update our font size tracker
      _myFontStyle = TextStyle(fontSize: myFontSize); // Generate updated text style
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // REQUIREMENT 4: Removed 'const' and applied _myFontStyle to both Text widgets
            Text(
              'You have pushed the button this many times:',
              style: _myFontStyle,
            ),
            Text(
              '$_counter',
              style: _myFontStyle,
            ),

            // Adding structural spacing between text elements and our control slider
            const SizedBox(height: 50),

            // REQUIREMENT 5 (UI component): Slider layout to call the logic function on change
            Slider(
              min: 10.0,
              max: 100.0,
              value: myFontSize.clamp(10.0, 100.0), // Keeps value strictly inside safe layout boundaries
              onChanged: (double value) {
                _setNewValue(value);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}