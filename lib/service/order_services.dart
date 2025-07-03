import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderService {
  static Future<void> storeOrder({
    required List<Map<String, dynamic>> cartItems,
    required String paymentMode,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userId = user.uid;
    final timestamp = Timestamp.now();

    for (final item in cartItems) {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(userId) // each user's document
          .collection('user_orders') // their personal subcollection
          .add({
        'product_name': item['name'],
        'quantity': item['quantity'] ?? 1,
        'price': item['price'],
        'payment_mode': paymentMode,
        'timestamp': timestamp,
      });
    }
  }
}
