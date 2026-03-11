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
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const VoteEligibilityPage(),
    );
  }
}

class VoteEligibilityPage extends StatefulWidget {
  const VoteEligibilityPage({super.key});

  @override
  State<VoteEligibilityPage> createState() => _VoteEligibilityPageState();
}

class _VoteEligibilityPageState extends State<VoteEligibilityPage> {
  final TextEditingController _ageController = TextEditingController();
  String _result = "";

  void _checkEligibility() {
    int age = int.tryParse(_ageController.text) ?? 0;
    if (age >= 18) {
      setState(() {
        _result = "You are eligible to vote.";
      });
    } else {
      setState(() {
        _result = "You are not eligible to vote.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vote Eligibility Checker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkEligibility,
              child: const Text('Check Eligibility'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
