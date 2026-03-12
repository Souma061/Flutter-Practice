import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AgeCalculatorPage(),
    );
  }
}

class AgeCalculatorPage extends StatefulWidget {
  const AgeCalculatorPage({super.key});

  @override
  State<AgeCalculatorPage> createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  // final TextEditingController _ageController = TextEditingController();
  // String _result = "";

  // void _calculateAge() {
  //   if (_ageController.text.isEmpty) {
  //     setState(() {
  //       _result = "Please enter your age";
  //     });
  //     return;
  //   }
  //   try {
  //     DateTime dob = DateTime.parse(_ageController.text);
  //     DateTime today = DateTime.now();

  //     if (dob.isAfter(today)) {
  //       setState(() {
  //         _result = "Date of birth cannot be in the future";
  //       });
  //       return;
  //     }
  //     int years = today.year - dob.year;
  //     int month = today.month - dob.month;
  //     int day = today.day - dob.day;

  //     if (day < 0) {
  //       month--;
  //       day += DateTime(today.year, today.month, 0).day;
  //     }
  //     if (month < 0) {
  //       years--;
  //       month += 12;
  //     }
  //     setState(() {
  //       _result = "You are $years years, $month months and $day days old.";
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _result = "Invalid date format. Please use YYYY-MM-DD.";
  //     });
  //   }
  // }

  final TextEditingController _ageController = TextEditingController();
  String _result = "";

  void _calculateAge() {
    if (_ageController.text.isEmpty) {
      setState(() {
        _result = "Enter your age";
      });
      return;
    }
    try {
      DateTime dob = DateTime.parse(_ageController.text);
      DateTime today = DateTime.now();

      if (dob.isAfter(today)) {
        _result = "DOB can't be in future";
      }
      int years = today.year - dob.year;
      int months = today.month - dob.month;
      int day = today.day - dob.day;

      if (day < 0) {
        months--;
        day += DateTime(today.year, today.month, 0).day;
      }
      if (months < 0) {
        years--;
        months += 12;
      }
      setState(() {
        _result = 'You are $years years  $months and $day day old';
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Age Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: "Enter your date of birth (YYYY-MM-DD)",
                hintText: "YYYY-MM-DD",
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAge,
              child: const Text("Calculate Age"),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
