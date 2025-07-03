// import 'package:flutter/material.dart';
// import 'package:festive_care_cure/data/fest_data.dart';

// class FestivalDetailsPage extends StatelessWidget {
//   final Festival festival;

//   // Constructor to receive the festival data
//   FestivalDetailsPage({required this.festival});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(festival.name)),
//       body: Column(
//         children: [
//           // Display the festival image
//           Image.asset(festival.imageUrl),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               festival.description, // Display the description
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// // }

import 'package:festive_care_cure/data/ayrvedic_data.dart';
import 'package:flutter/material.dart';
import '../data/fest_data.dart';

import 'package:carousel_slider/carousel_slider.dart';

class FestivalDetailsPage extends StatelessWidget {
  final Festival festival;

  FestivalDetailsPage({required this.festival});

  void _showFullDescription(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(festival.name, style: TextStyle(fontSize: 22)),
        backgroundColor: const Color.fromARGB(255, 138, 87, 11),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                ),
                items: festival.imageUrls.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Text(
                "Details",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 10),
              _buildCategoryCard(context, 'Importance', festival.importance),
              _buildCategoryCard(
                  context, 'Puranic Narratives', festival.puranicNarratives),
              _buildCategoryCard(
                  context, 'Story Behind Fest', festival.storyBehindFest),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String content) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(
          content.length > 100 ? content.substring(0, 100) + '...' : content,
          style: TextStyle(fontSize: 16),
        ),
        onTap: () => _showFullDescription(context, title, content),
      ),
    );
  }
}

class AyurvedicDetailsPage extends StatelessWidget {
  final AyurvedicMedicine ayurvedicItem;

  AyurvedicDetailsPage({required this.ayurvedicItem});

  void _showFullDescription(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ayurvedicItem.name),
        backgroundColor: const Color.fromARGB(255, 0, 82, 27),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ayurvedicItem.imageUrls.isNotEmpty)
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 0.8,
                ),
                items: ayurvedicItem.imageUrls.map((imagePath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
              ),
            SizedBox(height: 16),
            _buildCategoryCard(context, 'Importance', ayurvedicItem.importance),
            _buildCategoryCard(
                context, 'Curing Properties', ayurvedicItem.curingProperties),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String content) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(
          content.length > 100 ? content.substring(0, 100) + '...' : content,
          style: TextStyle(fontSize: 16),
        ),
        onTap: () => _showFullDescription(context, title, content),
      ),
    );
  }
}



// import 'package:festive_care_cure/data/ayrvedic_data.dart';
// import 'package:flutter/material.dart';
// import 'package:festive_care_cure/data/fest_data.dart';


// class AyurvedicDetailsPage extends StatelessWidget {
//   final AyurvedicMedicine ayurvedicItem;

//   // Constructor to receive the ayurvedic item data
//   AyurvedicDetailsPage({required this.ayurvedicItem});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(ayurvedicItem.name),
//         backgroundColor: Colors.green, // AppBar color for ayurvedic items
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Display the ayurvedic item large image (imageurl)
//           Image.asset(ayurvedicItem.imageurl), // Large Image for details page
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               ayurvedicItem.description, // Display the description
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//           SizedBox(height: 16),
//           // Display the small image (image) for the item
//           Image.asset(
//               ayurvedicItem.image), // Small Image for the Ayurvedic Item
//         ],
//       ),
//     );
//   }
// }
