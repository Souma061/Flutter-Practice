/*
    Develop a single-page app using Flutter with the following features :
. An AppBar displaying the app name as 'XYZ Tour & Travels.'
· A side drawer with the name 'Tourist-spots'.
· A floating action button that, when clicked, navigates to a page displaying pictures of different tourist
35

places.
*/

import 'package:flutter/material.dart';

class TouristPage extends StatelessWidget {
  const TouristPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'assets/kashmir.avif',
      'assets/mountain.avif',
      'assets/iceland.avif',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tourist Spots',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        // Tells the builder how many items are in your list
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(12.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageUrls[index], // Accesses the path from your list
                fit: BoxFit.cover,
                height: 250,
                // Helpful error handling in case a filename is misspelled
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Text('Image not found in assets'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
