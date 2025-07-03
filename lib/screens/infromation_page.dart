import 'package:flutter/material.dart';
import 'festive_info.dart';
import 'ayurvedic_info.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [
                  const Color.fromARGB(255, 255, 255, 255),
                  const Color.fromARGB(255, 255, 140, 0),
                ],
              ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black87, Colors.black54],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryCard(
              imagePath: 'assets/picture/festPic.jpg',
              categoryText: 'Festivals',
              gradientColors: [Colors.grey.shade800, Colors.grey.shade600],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FestiveInfoPage()),
                );
              },
            ),
            SizedBox(height: 30),
            CategoryCard(
              imagePath: 'assets/picture/ayurvedic.jpg', // Your image path
              categoryText: 'Ayurvedic',
              gradientColors: [Colors.grey.shade800, Colors.grey.shade600],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AyurvedicInfoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String categoryText;
  final List<Color> gradientColors;
  final VoidCallback onPressed;

  // ignore: prefer_const_constructors_in_immutables
  CategoryCard({
    super.key,
    required this.imagePath,
    required this.categoryText,
    required this.gradientColors,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 90, // Image size
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  categoryText,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
