// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CustomerSupportPage extends StatelessWidget {
//   const CustomerSupportPage({Key? key}) : super(key: key);

//   // Function to launch an email
//   Future<void> _launchEmail(String email) async {
//     final Uri emailUri = Uri(
//       scheme: 'mailto',
//       path: email,
//       queryParameters: {
//         'subject': 'Support Request',
//       },
//     );
//     if (!await launchUrl(emailUri)) {
//       throw 'Could not launch $emailUri';
//     }
//   }

//   // Function to launch a phone call
//   Future<void> _launchPhone(String phoneNumber) async {
//     final Uri phoneUri = Uri(
//       scheme: 'tel',
//       path: phoneNumber,
//     );
//     if (!await launchUrl(phoneUri)) {
//       throw 'Could not launch $phoneUri';
//     }
//   }

//   // Function to launch WhatsApp
//   Future<void> _launchWhatsApp(String phoneNumber) async {
//     final Uri whatsappUri = Uri.parse(
//         'https://wa.me/$phoneNumber?text=Hi, I need support with your app.');
//     if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
//       throw 'Could not launch $whatsappUri';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Customer Support'),
//         backgroundColor: Colors.blueAccent,
//         elevation: 0,
//       ),
//       body: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16.0),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.lightBlue],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             const Text(
//               'We are here to help you!',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Feel free to contact us through any of the channels below.',
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 16,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 40),
//             // Email Button
//             SupportButton(
//               icon: Icons.email,
//               label: 'Email Us',
//               color: Colors.orange,
//               onPressed: () => _launchEmail('uu441076@gmail.com'),
//             ),
//             const SizedBox(height: 20),
//             // Call Button
//             SupportButton(
//               icon: Icons.phone,
//               label: 'Call Us',
//               color: Colors.green,
//               onPressed: () => _launchPhone('+91 6362746153'),
//             ),
//             const SizedBox(height: 20),
//             // WhatsApp Button
//             SupportButton(
//               icon: FontAwesomeIcons.whatsapp,
//               label: 'Chat on WhatsApp',
//               color: Colors.teal,
//               onPressed: () => _launchWhatsApp('+91 9632199086'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Reusable Button Widget
// class SupportButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onPressed;

//   const SupportButton({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         foregroundColor: Colors.white,
//         backgroundColor: color,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         elevation: 5,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 24),
//           const SizedBox(width: 10),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

  // Function to launch an email
  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Support Request',
      },
    );
    if (!await launchUrl(emailUri)) {
      throw 'Could not launch $emailUri';
    }
  }

  // Function to launch a phone call
  Future<void> _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(phoneUri)) {
      throw 'Could not launch $phoneUri';
    }
  }

  // Function to launch WhatsApp
  Future<void> _launchWhatsApp(String phoneNumber) async {
    final Uri whatsappUri = Uri.parse(
        'https://wa.me/$phoneNumber?text=Hi, I need support with your app.');
    if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $whatsappUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Support'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'We are here to help you!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Feel free to contact us through any of the channels below.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Email Button
            SupportButton(
              icon: Icons.email,
              label: 'Email Us',
              color: Colors.orange,
              onPressed: () => _launchEmail('uu441076@gmail.com'),
            ),
            const SizedBox(height: 20),
            // Call Button
            SupportButton(
              icon: Icons.phone,
              label: 'Call Us',
              color: Colors.green,
              onPressed: () => _launchPhone('+91 6362746153'),
            ),
            const SizedBox(height: 20),
            // WhatsApp Button
            SupportButton(
              icon: FontAwesomeIcons.whatsapp,
              label: 'Chat on WhatsApp',
              color: Colors.teal,
              onPressed: () => _launchWhatsApp('+91 9632199086'),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Button Widget
class SupportButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  // ignore: use_super_parameters
  const SupportButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
