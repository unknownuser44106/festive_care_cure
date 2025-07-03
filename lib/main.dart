import 'package:festive_care_cure/widgets/items_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:festive_care_cure/signup.dart'; // Import SignUp
import 'package:festive_care_cure/welcome.dart'; // Import Welcome screen
import 'package:festive_care_cure/providers/cart_provider.dart'; // Import CartProvider
import 'package:provider/provider.dart'; // Import Provider package
import 'screens/cart_page.dart'; // Import CartPage screen
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:festive_care_cure/screens/payment_page.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_super_parameters
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider()
        ..fetchCartItems(), // Providing CartProvider to the entire app
      child: MaterialApp(
          title: 'Festive Care Cure is my app',
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: ThemeData.dark(),
          home:
              WelcomeScreen() // Keeping the WelcomeScreen as the initial screen
          ),
    );
  }
}
