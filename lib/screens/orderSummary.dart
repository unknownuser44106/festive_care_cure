// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:festive_care_cure/service/users_profile_data.dart';
// import 'package:festive_care_cure/screens/userProfile.dart';

// class OrderSummaryPage extends StatefulWidget {
//   final List<Map<String, dynamic>> cartItems; // Cart items list
//   final double totalPrice; // Total price

//   const OrderSummaryPage({
//     Key? key,
//     required this.cartItems,
//     required this.totalPrice,
//   }) : super(key: key);

//   @override
//   _OrderSummaryPageState createState() => _OrderSummaryPageState();
// }

// class _OrderSummaryPageState extends State<OrderSummaryPage> {
//   final UserProfileService userProfileService = UserProfileService();
//   Map<String, dynamic>? userProfileData;

//   @override
//   void initState() {
//     super.initState();
//     fetchUserProfile();
//   }

//   Future<void> fetchUserProfile() async {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       Map<String, dynamic>? data =
//           await userProfileService.getUserProfile(currentUser.uid);
//       setState(() {
//         userProfileData = data;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Order Summary'),
//         backgroundColor: const Color.fromARGB(255, 72, 47, 18),
//       ),
//       body: userProfileData == null
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Display User Profile Data for Delivery Confirmation
//                   Text(
//                       'Name: ${userProfileData!['userName'] ?? 'Not Available'}',
//                       style: const TextStyle(fontSize: 18)),
//                   Text(
//                       'Street: ${userProfileData!['streetName'] ?? 'Not Available'}',
//                       style: const TextStyle(fontSize: 18)),
//                   Text(
//                       'Landmark: ${userProfileData!['landmark'] ?? 'Not Available'}',
//                       style: const TextStyle(fontSize: 18)),
//                   Text(
//                       'Phone: ${userProfileData!['mobileNumber'] ?? 'Not Available'}',
//                       style: const TextStyle(fontSize: 18)),
//                   Text(
//                       'Alternate Phone: ${userProfileData!['alternatePhoneNumber'] ?? 'Not Available'}',
//                       style: const TextStyle(fontSize: 18)),
//                   Text(
//                       'Postal Code: ${userProfileData!['postalCode'] ?? 'Not Available'}',
//                       style: const TextStyle(fontSize: 18)),

//                   const SizedBox(height: 20),

//                   // Display Cart Items
//                   const Text('Cart Items:', style: TextStyle(fontSize: 18)),
//                   const SizedBox(height: 10),

//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: widget.cartItems.length,
//                       itemBuilder: (context, index) {
//                         final item = widget.cartItems[index];
//                         return _buildCartItem(
//                           item['name'] ?? 'Item',
//                           '₹${item['price'] != null ? double.tryParse(item['price'].toString())?.toStringAsFixed(2) : '0.00'}',
//                           item['imageUrl'] ?? 'assets/placeholder.png',
//                           item['quantity'] ?? 1,
//                         );
//                       },
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // Display Total Price
//                   Text(
//                     "Total: ₹${widget.totalPrice.toStringAsFixed(2)}",
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // Edit Profile Button
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const UserProfileForm()),
//                         );
//                       },
//                       child: const Text('Edit Profile'),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // Confirm Order Button
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Order Confirmed')));
//                       },
//                       child: const Text('Confirm Order'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   // Helper method to display cart items
//   Widget _buildCartItem(
//       String productName, String price, String imagePath, int quantity) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: ListTile(
//         leading: Image.asset(imagePath, width: 50, height: 50), // Product image
//         title: Text(productName),
//         subtitle: Text(price), // Price
//         trailing: Text("Qty: $quantity"),
//       ),
//     );
//   }
// }

import 'package:festive_care_cure/screens/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:festive_care_cure/service/users_profile_data.dart';
import 'package:festive_care_cure/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class OrderSummaryPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  // ignore: use_super_parameters
  const OrderSummaryPage({
    Key? key,
    required this.cartItems,
    required this.totalPrice,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  final UserProfileService userProfileService = UserProfileService();
  Map<String, dynamic>? userProfileData;
  late List<Map<String, dynamic>> cartItems;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.cartItems);
    totalPrice = widget.totalPrice;
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Map<String, dynamic>? data =
          await userProfileService.getUserProfile(currentUser.uid);
      setState(() {
        userProfileData = data;
      });
    }
  }

  void removeItem(int index) {
    setState(() {
      totalPrice -= cartItems[index]['price'] * cartItems[index]['quantity'];
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4A3121),
        elevation: 4,
        centerTitle: true,
      ),
      body: userProfileData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Delivery Confirmation',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown)),
                          const Divider(),
                          _buildProfileDetail(Icons.person, 'Name',
                              userProfileData!['userName']),
                          _buildProfileDetail(Icons.location_on, 'Street',
                              userProfileData!['streetName']),
                          _buildProfileDetail(Icons.landscape, 'Landmark',
                              userProfileData!['landmark']),
                          _buildProfileDetail(Icons.phone, 'Phone',
                              userProfileData!['mobileNumber']),
                          _buildProfileDetail(
                              Icons.phone_android,
                              'Alternate Phone',
                              userProfileData!['alternatePhoneNumber']),
                          _buildProfileDetail(Icons.pin, 'Postal Code',
                              userProfileData!['postalCode']),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Cart Items:',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown)),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return _buildCartItem(
                        item['name'] ?? 'Item',
                        '₹${item['price']?.toStringAsFixed(2) ?? '0.00'}',
                        item['imageUrl'] ?? 'assets/placeholder.png',
                        item['quantity'] ?? 1,
                        () => removeItem(index),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      "Total: ₹${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 6,
                        shadowColor: Colors.greenAccent,
                      ),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .clearCart();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              totalAmount: totalPrice,
                              upiId:
                                  "maheshhvdme2016@ybl", // Replace with your actual UPI ID
                            ),
                          ),
                        );
                      },
                      child: const Text('Confirm Order',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileDetail(IconData icon, String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.brown),
          const SizedBox(width: 10),
          Text('$label: ${value ?? 'Not Available'}',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildCartItem(String productName, String price, String imagePath,
      int quantity, VoidCallback onDelete) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child:
              Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(productName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(price,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
