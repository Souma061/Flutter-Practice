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
      home: const ListViewPage(),
    );
  }
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = ["Souma", "Suparna", "Ritam"];

    return Scaffold(
      appBar: AppBar(title: const Text('List view')),

      body: ListView.builder(
        itemCount: items.length,

        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index]),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(itemName: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class DetailPage extends StatelessWidget {
  final String itemName;
  const DetailPage({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Text(
          itemName,
          style: TextStyle(fontSize: 28),


        ),
      ),
    );
  }
}
