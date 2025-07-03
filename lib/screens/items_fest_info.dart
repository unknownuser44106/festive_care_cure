// import 'package:flutter/material.dart';
// import 'package:festive_care_cure/widgets/items_details.dart';
// import '../data/items_fest.dart'; // Import festival data

// class ItemsFestInfoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Festive Items"),
//         backgroundColor: Colors.orange,
//       ),
//       body: ListView.builder(
//         itemCount: itemsFest.length, // Using the festival data here
//         itemBuilder: (context, index) {
//           var item = itemsFest[index]; // Get the festival item

//           return Card(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             elevation: 4,
//             child: ListTile(
//               leading: Image.asset(
//                 item.icon, // show the icon here
//                 width: 50,
//                 height: 50,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Icon(Icons.image_not_supported);
//                 },
//               ),
//               title: Text(item.name,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               subtitle: Text(
//                 item.description.length > 100
//                     ? item.description.substring(0, 100) + '...'
//                     : item.description,
//                 style: TextStyle(fontSize: 16),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ItemDetails(
//                       name: item.name,
//                       description: item.description,
//                       imageUrls: item.imageUrls,
//                       price: item.price,
//                       items: item.items,
//                       icon: item.icon, // pass icon to next screen too
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:festive_care_cure/widgets/items_details.dart';
import '../data/items_fest.dart'; // Import festival data

class ItemsFestInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Festive Items"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: itemsFest.length,
        itemBuilder: (context, index) {
          var item = itemsFest[index];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: ListTile(
              leading: Image.asset(
                item.icon,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported);
                },
              ),
              title: Text(
                item.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios), // This is your ">" symbol
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(
                      name: item.name,
                      description: item.description,
                      imageUrls: item.imageUrls,
                      price: item.price,
                      items: item.items,
                      icon: item.icon,
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
