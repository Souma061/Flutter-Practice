import 'dart:async';

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
      home: const StopWatchPage(),
    );
  }
}

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  // final Stopwatch _stopwatch = Stopwatch();
  // late Timer _timer;
  // String _result = '00:00:00';

  // @override
  // void dispose() {
  //   if (_stopwatch.isRunning) {
  //     _timer.cancel();
  //   }
  //   super.dispose();
  // }

  // //start
  // void _start() {
  //   _stopwatch.start();
  //   _timer = Timer.periodic(const Duration(milliseconds: 10), (Timer t) {
  //     setState(() {
  //       _result = _formatTime(_stopwatch.elapsedMilliseconds);
  //     });
  //   });
  // }

  // void _stop() {
  //   _stopwatch.stop();
  //   _timer.cancel();
  //   setState(() {});
  // }

  // void _reset() {
  //   _stopwatch.reset();
  //   _stopwatch.stop();
  //   setState(() {
  //     _result = '00:00:00';
  //   });
  // }

  // String _formatTime(int milliseconds) {
  //   Duration duration = Duration(milliseconds: milliseconds);

  //   String minutes = duration.inMinutes
  //       .remainder(60)
  //       .toString()
  //       .padLeft(2, '0');

  //   String seconds = duration.inSeconds
  //       .remainder(60)
  //       .toString()
  //       .padLeft(2, '0');

  //   String centiseonds = (duration.inMilliseconds.remainder(1000) ~/ 10)
  //       .toString()
  //       .padLeft(2, '0');

  //   return '$minutes:$seconds.$centiseonds';
  // }

  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _result = '00:00:00';

  @override
  void dispose() {
    if (_stopwatch.isRunning) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _start() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 10), (Timer t) {
      setState(() {
        _result = _formatTime(_stopwatch.elapsedMilliseconds);
      });
    });
  }

  void _stop() {
    _stopwatch.stop();
    _timer.cancel();
    setState(() {});
  }

  void _reset() {
    _stopwatch.reset();
    _stopwatch.stop();
    setState(() {
      _result = '00:00:00';
    });
  }

  String _formatTime(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);

    String minutes = duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String seconds = duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String centiSeconds = (duration.inMilliseconds.remainder(1000) ~/ 10)
        .toString()
        .padLeft(2, '0');

    return '$minutes:$seconds:$centiSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stop Watch')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _result,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _start, child: const Text('Start')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _stop, child: const Text('Stop')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _reset, child: const Text('Reset')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
