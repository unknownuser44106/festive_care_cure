// // lib/screens/order_summary_page.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:festive_care_cure/providers/cart_provider.dart';
// import 'package:festive_care_cure/service/users_profile_data.dart';
// // Assuming you have a provider for user profile

// class OrderSummaryPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Access user profile and cart information
//     final userProfile = Provider.of<UserProfileService>(context).getUserProfile;
//     final cartItems = Provider.of<CartProvider>(context).cartItems;
//     final totalPrice = Provider.of<CartProvider>(context).totalPrice;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Summary'),
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // User Profile Section
//               Text(
//                 "Delivery Address:",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text("Name: ${userProfile.name}"),
//               Text("Email: ${userProfile.email}"),
//               Text("Phone: ${userProfile.phone}"),
//               Text("Address: ${userProfile.address}"),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to Edit Profile Page
//                   // Navigator.push(...)
//                 },
//                 child: Text("Edit Profile"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Cart Items Section
//               Text(
//                 "Cart Items:",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: cartItems.length,
//                 itemBuilder: (context, index) {
//                   final item = cartItems[index];
//                   return ListTile(
//                     leading: Image.asset(item['imageUrl']),
//                     title: Text(item['name']),
//                     subtitle: Text("₹${item['price']}"),
//                     trailing: Text("x${item['quantity']}"),
//                   );
//                 },
//               ),
//               SizedBox(height: 20),

//               // Total Price Section
//               Text(
//                 "Total: ₹$totalPrice",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),

//               // Checkout Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle the actual purchase/checkout logic
//                   // You can navigate to a final confirmation page or perform a purchase
//                 },
//                 child: Text("Buy Now"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// extension on Future<Map<String, dynamic>?> Function(String userId) {
//   get name => null;
  
//   get email => null;
// }
