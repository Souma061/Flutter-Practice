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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RestaurantTipsPage(),
    );
  }
}

class RestaurantTipsPage extends StatefulWidget {
  const RestaurantTipsPage({super.key});

  @override
  State<RestaurantTipsPage> createState() => _RestaurantTipsPageState();
}

class _RestaurantTipsPageState extends State<RestaurantTipsPage> {
  final TextEditingController _billAmountController = TextEditingController();
  final TextEditingController _tipPercentageController =
      TextEditingController();

  double _totalBill = 0.0;
  double _tipAmount = 0.0;

  final _currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: '\$');

  void _calculateTip() {
    final double bill = double.tryParse(_billAmountController.text) ?? 0.0;
    final double percentage =
        double.tryParse(_tipPercentageController.text) ?? 0.0;

    setState(() {
      _tipAmount = bill * (percentage / 100);
      _totalBill = bill + _tipAmount;
    });
  }

  @override
  void dispose() {
    _billAmountController.dispose();
    _tipPercentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Tips Calculator',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _billAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bill Amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tipPercentageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tip Percentage',
                suffixText: '%',
                prefixIcon: Icon(Icons.percent),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calculateTip,
              child: const Text('Calculate Tip'),
            ),
            const SizedBox(height: 24),
            Text(
              'Tip Amount: ${_currencyFormat.format(_tipAmount)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Bill: ${_currencyFormat.format(_totalBill)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
