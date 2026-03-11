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
      home: const SICalculatorPage(),
    );
  }
}

class SICalculatorPage extends StatefulWidget {
  const SICalculatorPage({super.key});

  @override
  State<SICalculatorPage> createState() => _SICalculatorPageState();
}

class _SICalculatorPageState extends State<SICalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _prinipalController = TextEditingController();
  final _rateController = TextEditingController();

  final List<int> _timeOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int? _selectedTime;
  String _result = "";

  void _calculateSI() {
    if (_formKey.currentState!.validate() && _selectedTime != null) {
      double p = double.parse(_prinipalController.text);
      double r = double.parse(_rateController.text);
      int t = _selectedTime!;

      double si = (p * r * t) / 100;
      setState(() {
        _result = "Simple Interest: $si";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Interest Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _prinipalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Principal Amount',
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter principal amount'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Rate of Interest',
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter rate of interest'
                    : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                hint: const Text('Select Time (years)'),
                initialValue: _selectedTime,
                items: _timeOptions.map((year) {
                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
                onChanged: (int? value) {
                  setState(() {
                    _selectedTime = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _calculateSI,
                child: const Text('Calculate SI'),
              ),
              const SizedBox(height: 24),
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
