import 'dart:math';

import 'package:flutter/material.dart';

class NumberGussingPage extends StatefulWidget {
  const NumberGussingPage({super.key});

  @override
  State<NumberGussingPage> createState() => _NumberGussingPageState();
}

class _NumberGussingPageState extends State<NumberGussingPage> {
  final TextEditingController _numberController = TextEditingController();
  final int _randomNumber = Random().nextInt(100) + 1;
  String _message = '';

  void _checkGuess() {
    int? guess = int.tryParse(_numberController.text);
    if (guess == null) {
      setState(() {
        _message = 'Please enter a valid number';
      });
    } else if (guess < _randomNumber) {
      setState(() {
        _message = 'Too low! Try again.';
      });
    } else if (guess > _randomNumber) {
      setState(() {
        _message = 'Too high! Try again.';
      });
    } else {
      setState(() {
        _message = 'Congratulations! You guessed the number!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Number Guessing Game',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your guess (1-100)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _checkGuess, child: Text('Check Guess')),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
