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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const TemperaturePage(),
    );
  }
}

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final TextEditingController _inputController = TextEditingController();

  String inputUnit = "Celcius";
  String outputUnit = "Fehrenheit";

  double result = 0;

  void _convertTemp() {
    double value = double.tryParse(_inputController.text) ?? 0;
    setState(() {
      if (inputUnit == "Celcius" && outputUnit == "Fehrenheit") {
        result = (value * 9 / 5) + 32;
      } else if (inputUnit == "Fehrenheit" && outputUnit == "Celcius") {
        result = (value - 32) * 5 / 9;
      } else {
        result = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temp Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Temperature',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: inputUnit,
              items: const [
                DropdownMenuItem(value: "Celcius", child: Text('Celcius')),
                DropdownMenuItem(
                  value: "Fehrenheit",
                  child: Text('Fehrenheit'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  inputUnit = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: outputUnit,
              items: const [
                DropdownMenuItem(value: "Celcius", child: Text('Celcius')),
                DropdownMenuItem(
                  value: "Fehrenheit",
                  child: Text('Fehrenheit'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  outputUnit = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemp,
              child: const Text('Convert'),
            ),
            Text(
              "Result: ${result.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
