import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festive_care_cure/models/cart_model.dart';

class CartService {
  // Function to add item to Firestore
  Future<void> addItemToCart(String userId, CartItem cartItem) async {
    final userCartRef = FirebaseFirestore.instance
        .collection('users') // Main collection for users
        .doc(userId) // Unique user ID
        .collection('cart'); // Sub-collection to store cart items

    try {
      await userCartRef.add(cartItem.toMap()); // Add cart item to Firestore
    } catch (e) {
      print("Error adding item to cart: $e");
    }
  }

  // Function to retrieve all cart items for a user
  Future<List<CartItem>> getCartItems(String userId) async {
    final userCartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart');

    try {
      QuerySnapshot snapshot = await userCartRef.get();
      return snapshot.docs
          .map((doc) => CartItem.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching cart items: $e");
      return [];
    }
  }

  // Function to remove item from Firestore
  Future<void> removeItemFromCart(String userId, String cartItemId) async {
    final userCartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(cartItemId); // Unique ID for the cart item

    try {
      await userCartRef.delete(); // Remove the cart item from Firestore
    } catch (e) {
      print("Error removing item from cart: $e");
    }
  }
}
