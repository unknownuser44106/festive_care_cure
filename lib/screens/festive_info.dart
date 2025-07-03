import 'package:flutter/material.dart';
import 'package:festive_care_cure/data/fest_data.dart'; // Import your fest_data.dart
import 'package:festive_care_cure/widgets/details.dart';

// ignore: use_key_in_widget_constructors
class FestiveInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Major Hindu Festivals'),
        backgroundColor: Colors.deepOrange, // A festive color
      ),
      body: ListView.builder(
        itemCount: festivals.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(festivals[index].icon),
              ),
              title: Text(
                festivals[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Month: ${festivals[index].month}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.deepOrange,
              ),
              onTap: () {
                // Navigate to the details page and pass the selected festival data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FestivalDetailsPage(festival: festivals[index]),
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
