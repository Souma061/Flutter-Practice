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
      home: const CurrencyConverterPage(),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _currencyController = TextEditingController();
  double _result = 0;

  String fromCurrency = "INR";
  String toCurrency = "USD";

  void _currencyConverter() {
    double currency = double.parse(_currencyController.text);
    if (fromCurrency == "INR" && toCurrency == "USD") {
      _result = currency / 86;
    } else if (fromCurrency == "USD" && toCurrency == "USD") {
      _result = currency * 86;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _currencyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: fromCurrency,
              items: ["INR", "USD"].map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  fromCurrency = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: toCurrency,
              items: ["INR", "USD"].map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  toCurrency = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _currencyConverter,
              child: Text('Converter'),
            ),
            const SizedBox(height: 20),
            Text("Converted Amount: $_result", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
