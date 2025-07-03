// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'orderpage.dart';

// class PaymentPage extends StatefulWidget {
//   final double totalAmount;
//   final String upiId;

//   const PaymentPage({Key? key, required this.totalAmount, required this.upiId})
//       : super(key: key);

//   @override
//   _PaymentPageState createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   String selectedPaymentMethod = 'Credit Card';
//   late Razorpay _razorpay;

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();

//     // Razorpay Event Listeners
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     _razorpay.clear(); // Removes all listeners
//     super.dispose();
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Payment successful!")),
//     );
//     _saveOrderAndNavigate(context);
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Payment failed! Please try again.")),
//     );
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//           content: Text("External Wallet selected: ${response.walletName}")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.orange.shade100,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 'Total Price: ₹${widget.totalAmount.toStringAsFixed(2)}',
//                 style:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text('Select Payment Method:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             RadioListTile(
//               title: const Text('Credit Card'),
//               value: 'Credit Card',
//               groupValue: selectedPaymentMethod,
//               onChanged: (value) {
//                 setState(() {
//                   selectedPaymentMethod = value.toString();
//                 });
//               },
//             ),
//             RadioListTile(
//               title: const Text('PhonePe'),
//               value: 'PhonePe',
//               groupValue: selectedPaymentMethod,
//               onChanged: (value) {
//                 setState(() {
//                   selectedPaymentMethod = value.toString();
//                 });
//               },
//             ),
//             RadioListTile(
//               title: const Text('Cash on Delivery'),
//               value: 'Cash on Delivery',
//               groupValue: selectedPaymentMethod,
//               onChanged: (value) {
//                 setState(() {
//                   selectedPaymentMethod = value.toString();
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                 ),
//                 onPressed: () {
//                   _processPayment(context);
//                 },
//                 child: const Text('Confirm Payment',
//                     style: TextStyle(fontSize: 18, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _processPayment(BuildContext context) async {
//     if (selectedPaymentMethod == 'PhonePe') {
//       var options = {
//         'key': 'rzp_test_vYtjhf4Ri2Wafu', // Replace with your Razorpay test key
//         'amount': (widget.totalAmount * 100).toInt(), // in paise
//         'name': 'Order Payment',
//         'description': 'Payment for order',
//         'prefill': {
//           'contact': '9123456789',
//           'email': 'user@example.com',
//         },
//         'external': {
//           'wallets': ['phonepe']
//         }
//       };

//       try {
//         _razorpay.open(options);
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//     } else {
//       // Handle other methods like Credit Card or COD
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Payment via $selectedPaymentMethod Confirmed')),
//       );
//       _saveOrderAndNavigate(context);
//     }
//   }

//   void _saveOrderAndNavigate(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> orderHistory = prefs.getStringList('orders') ?? [];

//     String newOrder = jsonEncode({
//       'amount': widget.totalAmount,
//       'date': DateTime.now().toString(),
//       'method': selectedPaymentMethod
//     });

//     orderHistory.add(newOrder);
//     await prefs.setStringList('orders', orderHistory);

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const OrderPage()),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'orderpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart'; // assuming you already have this

class PaymentPage extends StatefulWidget {
  final double totalAmount;
  final String upiId;

  const PaymentPage({Key? key, required this.totalAmount, required this.upiId})
      : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = 'Credit Card';
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();

    // Razorpay Event Listeners
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Payment successful!")),
    );
    _saveOrderAndNavigate(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Payment failed! Please try again.")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("External Wallet selected: ${response.walletName}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Total Price: ₹${widget.totalAmount.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Select Payment Method:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile(
              title: const Text('Credit Card'),
              value: 'Credit Card',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('PhonePe'),
              value: 'PhonePe',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('Cash on Delivery'),
              value: 'Cash on Delivery',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value.toString();
                });
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  _processPayment(context);
                },
                child: const Text('Confirm Payment',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment(BuildContext context) async {
    if (selectedPaymentMethod == 'PhonePe') {
      var options = {
        'key': 'rzp_test_vYtjhf4Ri2Wafu', // Replace with your Razorpay test key
        'amount': (widget.totalAmount * 100).toInt(), // in paise
        'name': 'Order Payment',
        'description': 'Payment for order',
        'prefill': {
          'contact': '9123456789',
          'email': 'user@example.com',
        },
        'external': {
          'wallets': ['phonepe']
        }
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      // Handle other methods like Credit Card or COD
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment via $selectedPaymentMethod Confirmed')),
      );
      _saveOrderAndNavigate(context);
    }
  }

  void _saveOrderAndNavigate(BuildContext context) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User not logged in.")),
      );
      return;
    }

    final cartItems = cartProvider.cartItems;

    List<Map<String, dynamic>> productList = cartItems.map((item) {
      return {
        'product_name': item['name'] ?? 'Unknown',
        'quantity': item['quantity'] ?? 1,
        'price': item['price'] ?? 0,
      };
    }).toList();

    final orderData = {
      'uid': user.uid,
      'products': productList,
      'total_amount': widget.totalAmount,
      'payment_method': selectedPaymentMethod,
      'timestamp': DateTime.now(),
    };

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('orders') // stores under each user's UID
          .add(orderData);

      await cartProvider.clearCart(); // clear cart after placing order

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OrderPage()),
      );
    } catch (e) {
      print("Failed to save order: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to save order.")),
      );
    }
  }
}
