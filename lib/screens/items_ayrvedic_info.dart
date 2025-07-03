// lib/screens/items_ayurvedic.dart

import 'package:festive_care_cure/widgets/items_details.dart';
import 'package:flutter/material.dart';
import '../data/items_ayurvedic.dart'; // Your Ayurvedic items list

class AyurvedicItemsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayurvedic Items"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: ayurvedicItems.length,
        itemBuilder: (context, index) {
          var item = ayurvedicItems[index];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: ListTile(
              title: Text(
                item.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                item.description.length > 100
                    ? item.description.substring(0, 100) + '...'
                    : item.description,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(
                      name: item.name,
                      description: item.description,
                      imageUrls: item.imageUrls,
                      items: [], // Ayurvedic items have no sub-items
                      icon: '', // Empty or default icon
                      price: item.price.toDouble(), // Hardcoded price
                      isAyurvedic: true, // IMPORTANT
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
