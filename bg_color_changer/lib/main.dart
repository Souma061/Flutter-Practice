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
      home: const BGColorChanger(),
    );
  }
}

class BGColorChanger extends StatefulWidget {
  const BGColorChanger({super.key});

  @override
  State<BGColorChanger> createState() => _BGColorChangerState();
}

class _BGColorChangerState extends State<BGColorChanger> {
  Color _bgColor = Colors.white;
  void _changeBGColor(Color color) {
    setState(() {
      _bgColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(title: const Text('BG Color Changer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Click the buttons to change background color',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => _changeBGColor(Colors.red),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Red'),
            ),
            ElevatedButton(
              onPressed: () => _changeBGColor(Colors.greenAccent),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: const Text('Green Accent'),
            ),
            ElevatedButton(
              onPressed: () => _changeBGColor(Colors.blue),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Blue'),
            ),
          ],
        ),
      ),
    );
  }
}
