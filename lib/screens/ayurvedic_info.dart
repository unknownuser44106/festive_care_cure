// // ayurvedic.dart
// import 'package:flutter/material.dart';
// import '../data/ayrvedic_data.dart';
// import '../widgets/details.dart';

// class AyurvedicPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Ayurvedic Items')),
//       body: ListView.builder(
//         itemCount: ayurvedicItems.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(ayurvedicItems[index].name),
//             onTap: () {
//               // Navigate to Ayurvedic item details page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AyurvedicDetailsPage(
//                       ayurvedicItem: ayurvedicItems[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:festive_care_cure/widgets/details.dart';
// import 'package:festive_care_cure/data/ayrvedic_data.dart';

// // Sample Ayurvedic medicine data with local images
// class AyurvedicMedicine {
//   final String name;
//   final String image;
//   final String description;

//   AyurvedicMedicine({
//     required this.name,
//     required this.image,
//     required this.description,
//   });
// }

// // List of Ayurvedic medicines with local image assets
// List<AyurvedicMedicine> ayurvedicMedicines = [
//   AyurvedicMedicine(
//     name: 'Tulsi',
//     image: 'assets/images/ayurvedic/tulsi.png',
//     description:
//         'Tulsi is considered a powerful herb in Ayurveda, known for its healing properties.',
//   ),
//   AyurvedicMedicine(
//     name: 'Neem',
//     image: 'assets/images/ayurvedic/neem.png',
//     description:
//         'Neem is known for its anti-inflammatory, antibacterial, and antifungal properties.',
//   ),
//   AyurvedicMedicine(
//     name: 'Ashwagandha',
//     image: 'assets/images/ayurvedic/ashwagandha.png',
//     description:
//         'Ashwagandha is a well-known herb used for stress reduction and enhancing vitality.',
//   ),
//   AyurvedicMedicine(
//     name: 'Amla',
//     image: 'assets/images/ayurvedic/amla.png',
//     description:
//         'Amla is rich in Vitamin C and is beneficial for strengthening the immune system.',
//   ),
//   AyurvedicMedicine(
//     name: 'Brahmi',
//     image: 'assets/images/ayurvedic/brahmi.png',
//     description: 'Brahmi is used to enhance memory and promote mental clarity.',
//   ),
//   // Add more medicines as required
// ];

// class AyurvedicInfoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ayurvedic Medicines'),
//         backgroundColor: Colors.green, // Green theme for Ayurveda
//       ),
//       body: ListView.builder(
//         itemCount: ayurvedicMedicines.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             elevation: 4,
//             child: ListTile(
//               contentPadding: EdgeInsets.all(10),
//               leading: CircleAvatar(
//                 radius: 25,
//                 backgroundImage: AssetImage(
//                     ayurvedicMedicines[index].image), // Display local image
//               ),
//               title: Text(
//                 ayurvedicMedicines[index].name,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 'Click to view details',
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               trailing: Icon(
//                 Icons.arrow_forward_ios,
//                 size: 16,
//                 color: Colors.green,
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AyurvedicDetailsPage(
//                         ayurvedicItem: ayurvedicMedicines[index]),
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

// import 'package:flutter/material.dart';
// import 'package:festive_care_cure/widgets/details.dart';
// import 'package:festive_care_cure/data/ayrvedic_data.dart';

// class AyurvedicInfoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ayurvedic Medicines'),
//         backgroundColor: Colors.green, // Green theme for Ayurveda
//       ),
//       body: ListView.builder(
//         itemCount: ayurvedicMedicines.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             elevation: 4,
//             child: ListTile(
//               contentPadding: EdgeInsets.all(10),
//               leading: CircleAvatar(
//                 radius: 25,
//                 backgroundImage: AssetImage(
//                     ayurvedicMedicines[index].image), // Display local image
//               ),
//               title: Text(
//                 ayurvedicMedicines[index].name,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 'Click to view details',
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               trailing: Icon(
//                 Icons.arrow_forward_ios,
//                 size: 16,
//                 color: Colors.green,
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AyurvedicDetailsPage(
//                         ayurvedicItem: ayurvedicMedicines[index]),
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

// import 'package:flutter/material.dart';
// import 'package:festive_care_cure/widgets/details.dart';
// import 'package:festive_care_cure/data/ayrvedic_data.dart';

// class AyurvedicMedicine {
//   final String name;
//   final String image;
//   final String description;

//   AyurvedicMedicine({
//     required this.name,
//     required this.image,
//     required this.description,
//   });
// }

// // List of Ayurvedic medicines
// List<AyurvedicMedicine> ayurvedicMedicines = [
//   AyurvedicMedicine(
//     name: 'Tulsi',
//     image: 'assets/images/ayurvedic/tulsi.png',
//     description:
//         'Tulsi is considered a powerful herb in Ayurveda, known for its healing properties.',
//   ),
//   AyurvedicMedicine(
//     name: 'Neem',
//     image: 'assets/images/ayurvedic/neem.png',
//     description:
//         'Neem is known for its anti-inflammatory, antibacterial, and antifungal properties.',
//   ),
//   AyurvedicMedicine(
//     name: 'Ashwagandha',
//     image: 'assets/images/ayurvedic/ashwagandha.png',
//     description:
//         'Ashwagandha is a well-known herb used for stress reduction and enhancing vitality.',
//   ),
// ];

// class AyurvedicInfoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ayurvedic Medicines'),
//         backgroundColor: Colors.green, // Green theme for Ayurveda
//       ),
//       body: ListView.builder(
//         itemCount: ayurvedicMedicines.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             elevation: 4,
//             child: ListTile(
//               contentPadding: EdgeInsets.all(10),
//               leading: CircleAvatar(
//                 radius: 25,
//                 backgroundImage: AssetImage(
//                   ayurvedicMedicines[index].image,
//                 ), // Display local image
//               ),
//               title: Text(
//                 ayurvedicMedicines[index].name,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 'Click to view details',
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               trailing: Icon(
//                 Icons.arrow_forward_ios,
//                 size: 16,
//                 color: Colors.green,
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AyurvedicDetailsPage(
//                       ayurvedicItem: ayurvedicMedicines[index],
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
import 'package:festive_care_cure/widgets/details.dart' as details;
import 'package:festive_care_cure/data/ayrvedic_data.dart';

// ignore: use_key_in_widget_constructors
class AyurvedicInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayurvedic Medicines'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: ayurvedicMedicines.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  ayurvedicMedicines[index].image,
                ),
              ),
              title: Text(
                ayurvedicMedicines[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Click to view details',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.green,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => details.AyurvedicDetailsPage(
                      ayurvedicItem: ayurvedicMedicines[index],
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
