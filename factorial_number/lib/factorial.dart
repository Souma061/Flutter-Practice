import 'package:flutter/material.dart';

class FactorialPage extends StatefulWidget {
  const FactorialPage({super.key});

  @override
  State<FactorialPage> createState() => _FactorialPageState();
}

class _FactorialPageState extends State<FactorialPage> {
  final TextEditingController _controller = TextEditingController();
  int? _result;

  void _calculateFactorial() {
    final int n = int.tryParse(_controller.text) ?? 0;
    int factorial = 1;
    for (int i = 1; i <= n; i++) {
      factorial *= i;
    }
    setState(() {
      _result = factorial;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Factorial Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateFactorial,
              child: const Text('Calculate Factorial'),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Text('Factorial: $_result', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
