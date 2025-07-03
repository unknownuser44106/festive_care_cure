// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class CartProvider with ChangeNotifier {
//   List<Map<String, dynamic>> _cartItems = [];

//   List<Map<String, dynamic>> get cartItems => _cartItems;

//   double get totalPrice => _cartItems.fold(0, (sum, item) {
//     return sum + ((item['price'] ?? 0) * (item['quantity'] ?? 1));
//   });

//   final user = FirebaseAuth.instance.currentUser;
//   CollectionReference<Map<String, dynamic>> get _cartRef {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//     return FirebaseFirestore.instance
//         .collection('users')  // Make sure 'users' is in the path
//         .doc(uid)
//         .collection('cart'); // Cart data for this user
//   }

//   Future<void> fetchCartItems() async {
//     final userId = FirebaseAuth.instance.currentUser?.uid;
//     if (userId != null) {
//       final cartSnapshot = await _cartRef.get();
//       _cartItems = cartSnapshot.docs.map((doc) {
//         final data = doc.data()!;
//         data['id'] = doc.id;
//         return data;
//       }).toList();

//       notifyListeners(); // Notify listeners to update the UI
//     }
//   }

//   Future<void> addToCart(Map<String, dynamic> item) async {
//     await _cartRef.add(item);  // Add item to Firestore
//     await fetchCartItems();    // Refresh the cart data
//   }

//   Future<void> removeFromCart(String docId) async {
//     await _cartRef.doc(docId).delete(); // Remove item from Firestore
//     await fetchCartItems(); // Refresh the cart data
//   }

//   Future<void> updateQuantity(String docId, int newQuantity) async {
//     await _cartRef.doc(docId).update({'quantity': newQuantity}); // Update quantity in Firestore
//     await fetchCartItems(); // Refresh the cart data
//   }

//   Future<void> clearCart() async {
//     final snapshot = await _cartRef.get();
//     for (var doc in snapshot.docs) {
//       await doc.reference.delete();
//     }
//     await fetchCartItems(); // Refresh the cart data
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class CartProvider with ChangeNotifier {
//   List<Map<String, dynamic>> _cartItems = [];

//   List<Map<String, dynamic>> get cartItems => _cartItems;

//   double get totalPrice => _cartItems.fold(0, (sum, item) {
//         return sum + ((item['price'] ?? 0) * (item['quantity'] ?? 1));
//       });

//   final user = FirebaseAuth.instance.currentUser;
//   CollectionReference<Map<String, dynamic>> get _cartRef {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//     return FirebaseFirestore.instance
//         .collection('users') // Make sure 'users' is in the path
//         .doc(uid)
//         .collection('cart'); // Cart data for this user
//   }

//   Future<void> fetchCartItems() async {
//     final userId = FirebaseAuth.instance.currentUser?.uid;
//     if (userId != null) {
//       final cartSnapshot = await _cartRef.get();
//       _cartItems = cartSnapshot.docs.map((doc) {
//         final data = doc.data()!;
//         data['id'] = doc.id;
//         return data;
//       }).toList();

//       notifyListeners(); // Notify listeners to update the UI
//     }
//   }

//   Future<void> addToCart(Map<String, dynamic> item) async {
//     await _cartRef.add(item); // Add item to Firestore
//     await fetchCartItems(); // Refresh the cart data
//   }

//   Future<void> removeFromCart(String docId) async {
//     await _cartRef.doc(docId).delete(); // Remove item from Firestore
//     await fetchCartItems(); // Refresh the cart data
//   }

//   Future<void> updateQuantity(String docId, int newQuantity) async {
//     await _cartRef
//         .doc(docId)
//         .update({'quantity': newQuantity}); // Update quantity in Firestore
//     await fetchCartItems(); // Refresh the cart data
//   }

//   // Increase the quantity of an item in the cart
//   Future<void> increaseQuantity(String docId) async {
//     final item = _cartItems.firstWhere((item) => item['id'] == docId);
//     int newQuantity = (item['quantity'] ?? 1) + 1;
//     await updateQuantity(docId, newQuantity); // Update quantity in Firestore
//   }

//   // Decrease the quantity of an item in the cart
//   Future<void> decreaseQuantity(String docId) async {
//     final item = _cartItems.firstWhere((item) => item['id'] == docId);
//     int newQuantity = (item['quantity'] ?? 1) - 1;
//     if (newQuantity > 0) {
//       await updateQuantity(docId, newQuantity); // Update quantity in Firestore
//     }
//   }

//   Future<void> clearCart() async {
//     final snapshot = await _cartRef.get();
//     for (var doc in snapshot.docs) {
//       await doc.reference.delete();
//     }
//     await fetchCartItems(); // Refresh the cart data
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  double get totalPrice => _cartItems.fold(0, (sum, item) {
        return sum + ((item['price'] ?? 0) * (item['quantity'] ?? 1));
      });

  final user = FirebaseAuth.instance.currentUser;
  CollectionReference<Map<String, dynamic>> get _cartRef {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection(
            'users') // Ensure this is the correct path for your app's Firestore structure
        .doc(uid)
        .collection('cart'); // Cart data for this user
  }

  Future<void> fetchCartItems() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final cartSnapshot = await _cartRef.get();
      _cartItems = cartSnapshot.docs.map((doc) {
        final data = doc.data()!;
        data['id'] = doc.id;
        return data;
      }).toList();

      notifyListeners(); // Notify listeners to update the UI
    }
  }

  // Modify the addToCart method to prevent duplicates and update the quantity if already exists
  Future<void> addToCart(Map<String, dynamic> item) async {
    // Check if the item already exists in the cart
    final existingItem = _cartItems.firstWhere(
      (cartItem) =>
          cartItem['name'] == item['name'] &&
          cartItem['seller'] == item['seller'] &&
          cartItem['price'] == item['price'],
      orElse: () => {}, // Return an empty map instead of null
    );

    if (existingItem.isNotEmpty) {
      // If item exists, update its quantity
      final newQuantity = existingItem['quantity'] + 1;
      await _cartRef.doc(existingItem['id']).update({'quantity': newQuantity});
    } else {
      // If the item is not in the cart, add it to Firestore
      await _cartRef.add({
        ...item,
        'quantity': 1, // Set initial quantity to 1
      });
    }

    // Refresh the cart after adding the item
    await fetchCartItems();
  }

  Future<void> removeFromCart(String docId) async {
    await _cartRef.doc(docId).delete(); // Remove item from Firestore
    await fetchCartItems(); // Refresh the cart data
  }

  Future<void> updateQuantity(String docId, int newQuantity) async {
    await _cartRef
        .doc(docId)
        .update({'quantity': newQuantity}); // Update quantity in Firestore
    await fetchCartItems(); // Refresh the cart data
  }

  // Increase the quantity of an item in the cart
  Future<void> increaseQuantity(String docId) async {
    final item = _cartItems.firstWhere((item) => item['id'] == docId);
    int newQuantity = (item['quantity'] ?? 1) + 1;
    await updateQuantity(docId, newQuantity); // Update quantity in Firestore
  }

  // Decrease the quantity of an item in the cart
  Future<void> decreaseQuantity(String docId) async {
    final item = _cartItems.firstWhere((item) => item['id'] == docId);
    int newQuantity = (item['quantity'] ?? 1) - 1;
    if (newQuantity > 0) {
      await updateQuantity(docId, newQuantity); // Update quantity in Firestore
    }
  }

  Future<void> clearCart() async {
    final snapshot = await _cartRef.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    await fetchCartItems(); // Refresh the cart data
  }
}
