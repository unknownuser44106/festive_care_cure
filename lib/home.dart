import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:festive_care_cure/widgets/drawer.dart'; // Import the AppDrawer

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: GoogleFonts.lato(),
        ),
        centerTitle: true,
      ),
      // drawer: AppDrawer(userName: userName), // Pass the user name here
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: GoogleFonts.lato(fontSize: 24),
        ),
      ),
    );
  }
}
