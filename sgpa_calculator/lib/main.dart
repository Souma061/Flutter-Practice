import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SgpaCalculatorPage(),
    );
  }
}

class SgpaCalculatorPage extends StatefulWidget {
  const SgpaCalculatorPage({super.key});

  @override
  State<SgpaCalculatorPage> createState() => _SgpaCalculatorPageState();
}

class _SgpaCalculatorPageState extends State<SgpaCalculatorPage> {
  final _nameCtrl = TextEditingController();
  final _semCtrl = TextEditingController();
  final _p1Ctrl = TextEditingController();
  final _p2Ctrl = TextEditingController();
  final _p3Ctrl = TextEditingController();

  String _sgpa = "";
  String _gp1 = "";
  String _gp2 = "";
  String _gp3 = "";

  void _calculateResult() {
    double? p1 = double.tryParse(_p1Ctrl.text);
    double? p2 = double.tryParse(_p2Ctrl.text);
    double? p3 = double.tryParse(_p3Ctrl.text);

    if (p1 == null || p2 == null || p3 == null) {
      return;
    }
    double calculateGp(double marks) => 3.0 + 0.1 * (marks - 30);
    setState(() {
      double gp1 = calculateGp(p1);
      double gp2 = calculateGp(p2);
      double gp3 = calculateGp(p3);
      double sgpa = (gp1 + gp2 + gp3) / 3;

      _gp1 = gp1.toStringAsFixed(2);
      _gp2 = gp2.toStringAsFixed(2);
      _gp3 = gp3.toStringAsFixed(2);
      _sgpa = sgpa.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SGPA Calculator',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _semCtrl,
              decoration: const InputDecoration(labelText: 'Semester'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _p1Ctrl,
              decoration: const InputDecoration(
                labelText: 'Marks for Subject 1',
              ),
            ),
            TextField(
              controller: _p2Ctrl,
              decoration: const InputDecoration(
                labelText: 'Marks for Subject 2',
              ),
            ),
            TextField(
              controller: _p3Ctrl,
              decoration: const InputDecoration(
                labelText: 'Marks for Subject 3',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateResult,
              child: const Text('Calculate SGPA'),
            ),
            const SizedBox(height: 20),
            Text('Grade Point for Subject 1: $_gp1'),
            Text('Grade Point for Subject 2: $_gp2'),
            Text('Grade Point for Subject 3: $_gp3'),
            const SizedBox(height: 20),
            Text(
              'SGPA: $_sgpa',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
