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
      home: const EmployeeSalarySleepPage(),
    );
  }
}

class EmployeeSalarySleepPage extends StatefulWidget {
  const EmployeeSalarySleepPage({super.key});

  @override
  State<EmployeeSalarySleepPage> createState() =>
      _EmployeeSalarySleepPageState();
}

class _EmployeeSalarySleepPageState extends State<EmployeeSalarySleepPage> {
  final TextEditingController _basicSalaryController = TextEditingController();
  String _result = '';

  void _calculateSalary() {
    double basic = double.tryParse(_basicSalaryController.text) ?? 0.0;
    if (basic <= 0) {
      setState(() {
        _result = 'Please enter a valid basic salary.';
      });
      return;
    }
    setState(() {
      double hra = basic * 0.20;
      double da = basic * 0.15;
      double ma = 600.0;
      double gross = basic + hra + da + ma;
      double it = basic * 0.05;
      double net = gross - it;

      _result =
          'Basic Salary: \$${basic.toStringAsFixed(2)}\n'
          'HRA: \$${hra.toStringAsFixed(2)}\n'
          'DA: \$${da.toStringAsFixed(2)}\n'
          'MA: \$${ma.toStringAsFixed(2)}\n'
          'Gross Salary: \$${gross.toStringAsFixed(2)}\n'
          'IT: \$${it.toStringAsFixed(2)}\n'
          'Net Salary: \$${net.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Salary Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _basicSalaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Basic Salary',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSalary,
              child: const Text('Calculate Salary'),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
