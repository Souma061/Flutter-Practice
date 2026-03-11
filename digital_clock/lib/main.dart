import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const DigitalClockPage(),
    );
  }
}

class DigitalClockPage extends StatefulWidget {
  const DigitalClockPage({super.key});

  @override
  State<DigitalClockPage> createState() => _DigitalClockPageState();
}

class _DigitalClockPageState extends State<DigitalClockPage> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();
  Color _bgColor = Colors.pink;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm:ss a').format(_currentTime);
    String formattedDate = DateFormat('dd-MM-yyyy').format(_currentTime);
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(title: const Text('Digital Clock')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedTime,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _bgColor = Colors.pink;
              },
              child: const Text('Pink'),
            ),
            ElevatedButton(
              onPressed: () {
                _bgColor = Colors.blue;
              },
              child: const Text('Blue'),
            ),
          ],
        ),
      ),
    );
  }
}
