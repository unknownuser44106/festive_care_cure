// chat gpt limit exceed so //

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:festive_care_cure/providers/cart_provider.dart';
// import 'package:festive_care_cure/screens/items_info.dart';
// import 'package:festive_care_cure/screens/orderSummary.dart';

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch cart items when the page loads
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//     cartProvider.fetchCartItems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//     final cartItems = cartProvider.cartItems;
//     final totalPrice = cartProvider.totalPrice;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Cart'),
//         backgroundColor: Colors.green,
//       ),
//       body: cartItems.isEmpty
//           ? Center(child: Text('Your cart is empty!'))
//           : ListView.builder(
//               itemCount: cartItems.length,
//               itemBuilder: (context, index) {
//                 final item = cartItems[index];
//                 return Card(
//                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                   child: ListTile(
//                     leading: item['imageUrl'].toString().startsWith('http')
//                         ? Image.network(item['imageUrl'], width: 50, height: 50)
//                         : Image.asset(item['imageUrl'], width: 50, height: 50),
//                     title: Text(item['name'] ?? 'Item'),
//                     subtitle: Text("Price: ₹${item['price']}"),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.remove_circle),
//                           onPressed: () => cartProvider.decreaseQuantity(index),
//                         ),
//                         Text('${item['quantity'] ?? 1}'),
//                         IconButton(
//                           icon: Icon(Icons.add_circle),
//                           onPressed: () => cartProvider.increaseQuantity(index),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.delete),
//                           onPressed: () async {
//                             final shouldRemove = await showDialog<bool>(
//                               context: context,
//                               builder: (ctx) => AlertDialog(
//                                 title: Text('Remove Item'),
//                                 content: Text(
//                                     'Are you sure you want to remove this item from the cart?'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () =>
//                                         Navigator.of(ctx).pop(false),
//                                     child: Text('Cancel'),
//                                   ),
//                                   TextButton(
//                                     onPressed: () =>
//                                         Navigator.of(ctx).pop(true),
//                                     child: Text(
//                                       'Remove',
//                                       style: TextStyle(color: Colors.red),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                             if (shouldRemove ?? false) {
//                               cartProvider.removeFromCart(item['id']);
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//       bottomNavigationBar: cartItems.isEmpty
//           ? Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ItemsInfoScreen()));
//                 },
//                 child: Text('Go back to shopping'),
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//               ),
//             )
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Total: ₹${totalPrice.toStringAsFixed(2)}",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => OrderSummaryPage(
//                             totalPrice: totalPrice,
//                             cartItems: cartItems,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Text('Buy now'),
//                     style:
//                         ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:festive_care_cure/providers/cart_provider.dart';
import 'package:festive_care_cure/screens/items_info.dart';
import 'package:festive_care_cure/screens/orderSummary.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    // Fetch cart items when the page loads
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    final totalPrice = cartProvider.totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Colors.green,
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty!'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                final docId = item['id']; // Get the docId for the item
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ListTile(
                    leading: item['imageUrl'].toString().startsWith('http')
                        ? Image.network(item['imageUrl'], width: 50, height: 50)
                        : Image.asset(item['imageUrl'], width: 50, height: 50),
                    title: Text(item['name'] ?? 'Item'),
                    subtitle: Text("Price: ₹${item['price']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () => cartProvider.decreaseQuantity(docId),
                        ),
                        Text('${item['quantity'] ?? 1}'),
                        IconButton(
                          icon: Icon(Icons.add_circle),
                          onPressed: () => cartProvider.increaseQuantity(docId),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            final shouldRemove = await showDialog<bool>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text('Remove Item'),
                                content: Text(
                                    'Are you sure you want to remove this item from the cart?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(ctx).pop(false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(ctx).pop(true),
                                    child: Text(
                                      'Remove',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            if (shouldRemove ?? false) {
                              cartProvider.removeFromCart(docId);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemsInfoScreen()));
                },
                child: Text('Go back to shopping'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total: ₹${totalPrice.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderSummaryPage(
                            totalPrice: totalPrice,
                            cartItems: cartItems,
                          ),
                        ),
                      );
                    },
                    child: Text('Buy now'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ],
              ),
            ),
    );
  }
}
