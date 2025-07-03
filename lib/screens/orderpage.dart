// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class OrderPage extends StatefulWidget {
//   // ignore: use_super_parameters
//   const OrderPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _OrderPageState createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> {
//   List<Map<String, dynamic>> orders = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadOrders();
//   }

//   void _loadOrders() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> orderHistory = prefs.getStringList('orders') ?? [];

//     setState(() {
//       orders = orderHistory
//           .map((order) => jsonDecode(order) as Map<String, dynamic>)
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text('Order History'), backgroundColor: Colors.blue),
//       body: orders.isEmpty
//           ? const Center(
//               child: Text('No orders found.', style: TextStyle(fontSize: 18)))
//           : ListView.builder(
//               itemCount: orders.length,
//               itemBuilder: (context, index) {
//                 final order = orders[index];
//                 return Card(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: ListTile(
//                     title: Text('₹${order['amount'].toString()}'),
//                     subtitle: Text(
//                         'Paid via: ${order['method']}\nDate: ${order['date']}'),
//                     leading: const Icon(Icons.shopping_cart),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart'; // For date formatting

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text("User not logged in"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
        backgroundColor: Colors.orange,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('orders')
            .orderBy('timestamp', descending: true) // Show latest first
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No orders found."));
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index].data() as Map<String, dynamic>;
              final productList = order['products'] as List<dynamic>;
              final timestamp = order['timestamp']?.toDate();
              final formattedDate = timestamp != null
                  ? DateFormat('dd MMM yyyy, hh:mm a').format(timestamp)
                  : "Unknown Date";

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("🗓️ Date: $formattedDate",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("💳 Payment: ${order['payment_method']}"),
                      Text("💰 Total: ₹${order['total_amount']}"),
                      const SizedBox(height: 10),
                      const Text("📦 Products:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 6),
                      ...productList.map((product) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                          child: Text(
                              "• ${product['product_name']} - Qty: ${product['quantity']}, ₹${product['price']}"),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
