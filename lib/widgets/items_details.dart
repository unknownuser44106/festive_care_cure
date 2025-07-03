// // lib/widgets/item_details.dart

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:festive_care_cure/providers/cart_provider.dart';
// import 'package:festive_care_cure/screens/cart_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ItemDetails extends StatefulWidget {
//   final String name;
//   final String description;
//   final List<String> imageUrls;
//   final List<String> items;
//   final String icon;
//   final double price;
//   final bool isAyurvedic; // NEW PARAMETER

//   const ItemDetails({
//     required this.name,
//     required this.description,
//     required this.imageUrls,
//     required this.items,
//     required this.icon,
//     required this.price,
//     this.isAyurvedic = false, // Default false for festival items
//   });

//   @override
//   State<ItemDetails> createState() => _ItemDetailsState();
// }

// class _ItemDetailsState extends State<ItemDetails> {
//   String? selectedSeller;
//   double? selectedPrice;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.isAyurvedic) {
//       // Ayurvedic -> Use hardcoded price
//       selectedPrice = widget.price;
//       selectedSeller = "FestiveCareCure"; // Default seller name
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text(widget.name),
//         backgroundColor: Colors.green,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Carousel
//             CarouselSlider.builder(
//               itemCount: widget.imageUrls.length,
//               itemBuilder: (context, index, realIndex) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(15.0),
//                   child: Image.asset(
//                     widget.imageUrls[index],
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 );
//               },
//               options: CarouselOptions(
//                 height: 250.0,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 enableInfiniteScroll: true,
//                 autoPlayInterval: Duration(seconds: 3),
//                 viewportFraction: 1.0,
//               ),
//             ),

//             SizedBox(height: 20),

//             // Items Included (only for festival items)
//             if (!widget.isAyurvedic) ...[
//               Text(
//                 "Items Included:",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 10),
//               for (var item in widget.items)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.check_circle, color: Colors.green, size: 20),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: Text(
//                           item,
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               SizedBox(height: 20),
//             ],

//             // Description
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 5.0,
//               child: ExpansionTile(
//                 backgroundColor: Colors.grey[900],
//                 collapsedBackgroundColor: Colors.grey[850],
//                 title: Text(
//                   'Description',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       widget.description,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // Seller Prices (Dynamic for festival, Hardcoded for Ayurvedic)
//             Text(
//               "Price:",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green,
//               ),
//             ),
//             SizedBox(height: 10),

//             if (widget.isAyurvedic)
//               ListTile(
//                 title: Text(
//                   "FestiveCareCure",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 trailing: Text(
//                   "₹${widget.price}",
//                   style: TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               )
//             else
//               FutureBuilder<QuerySnapshot>(
//                 future: FirebaseFirestore.instance
//                     .collection('seller_items')
//                     .where('status', isEqualTo: 'Approved')
//                     .get(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Text(
//                       "No approved sellers found.",
//                       style: TextStyle(color: Colors.white),
//                     );
//                   }

//                   final filteredDocs = snapshot.data!.docs.where((doc) {
//                     final data = doc.data() as Map<String, dynamic>;
//                     return data['festivals']?[widget.name]?['canProvide'] ==
//                         true;
//                   }).toList();

//                   if (filteredDocs.isEmpty) {
//                     return Text(
//                       "No sellers available for this festival.",
//                       style: TextStyle(color: Colors.white),
//                     );
//                   }

//                   return Column(
//                     children: filteredDocs.map((doc) {
//                       final data = doc.data() as Map<String, dynamic>;
//                       final sellerName = data['seller_name'] ?? 'Unknown';
//                       final price =
//                           data['festivals'][widget.name]['price'] ?? 0;

//                       final isSelected = selectedSeller == sellerName;

//                       return ListTile(
//                         leading: Icon(
//                           isSelected
//                               ? Icons.radio_button_checked
//                               : Icons.radio_button_off,
//                           color: Colors.green,
//                         ),
//                         title: Text(
//                           sellerName,
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         trailing: Text(
//                           "₹$price",
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onTap: () {
//                           setState(() {
//                             selectedSeller = sellerName;
//                             selectedPrice = price.toDouble();
//                           });
//                         },
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),

//             SizedBox(height: 20),

//             // Add to cart button
//             Center(
//               child: ElevatedButton.icon(
//                 onPressed: selectedSeller != null && selectedPrice != null
//                     ? () {
//                         Provider.of<CartProvider>(context, listen: false)
//                             .addToCart({
//                           'name': widget.name,
//                           'imageUrl': widget.imageUrls.first,
//                           'price': selectedPrice,
//                           'seller': selectedSeller,
//                         });

//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Added to Cart")),
//                         );
//                       }
//                     : null,
//                 icon: Icon(Icons.add_shopping_cart),
//                 label: Text("Add to Cart"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       selectedSeller != null ? Colors.green : Colors.grey,
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                   textStyle:
//                       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

//lib/widgets/item_details.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:festive_care_cure/providers/cart_provider.dart';
import 'package:festive_care_cure/screens/cart_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatefulWidget {
  final String name;
  final String description;
  final List<String> imageUrls;
  final List<String> items;
  final String icon;
  final double price;
  final bool isAyurvedic; // NEW PARAMETER

  const ItemDetails({
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.items,
    required this.icon,
    required this.price,
    this.isAyurvedic = false, // Default false for festival items
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  String? selectedSeller;
  double? selectedPrice;

  @override
  void initState() {
    super.initState();
    if (widget.isAyurvedic) {
      // Ayurvedic -> Use hardcoded price
      selectedPrice = widget.price;
      selectedSeller = "FestiveCareCure"; // Default seller name
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel
            CarouselSlider.builder(
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    widget.imageUrls[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
              options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 3),
                viewportFraction: 1.0,
              ),
            ),

            SizedBox(height: 20),

            // Items Included (only for festival items)
            if (!widget.isAyurvedic) ...[
              Text(
                "Items Included:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10),
              for (var item in widget.items)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20),
            ],

            // Description
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5.0,
              child: ExpansionTile(
                backgroundColor: Colors.grey[900],
                collapsedBackgroundColor: Colors.grey[850],
                title: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Seller Prices (Dynamic for festival, Hardcoded for Ayurvedic)
            Text(
              "Price:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),

            if (widget.isAyurvedic)
              ListTile(
                title: Text(
                  "FestiveCareCure",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  "₹${widget.price}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else
              FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection('seller_items')
                    .where('status', isEqualTo: 'Approved')
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text(
                      "No approved sellers found.",
                      style: TextStyle(color: Colors.white),
                    );
                  }

                  final filteredDocs = snapshot.data!.docs.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return data['festivals']?[widget.name]?['canProvide'] ==
                        true;
                  }).toList();

                  if (filteredDocs.isEmpty) {
                    return Text(
                      "No sellers available for this festival.",
                      style: TextStyle(color: Colors.white),
                    );
                  }

                  return Column(
                    children: filteredDocs.map((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      final sellerName = data['seller_name'] ?? 'Unknown';
                      final price =
                          data['festivals'][widget.name]['price'] ?? 0;

                      final isSelected = selectedSeller == sellerName;

                      return ListTile(
                        leading: Icon(
                          isSelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: Colors.green,
                        ),
                        title: Text(
                          sellerName,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          "₹$price",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedSeller = sellerName;
                            selectedPrice = price.toDouble();
                          });
                        },
                      );
                    }).toList(),
                  );
                },
              ),

            SizedBox(height: 20),

            // Add to cart button
            Center(
              child: ElevatedButton.icon(
                onPressed: selectedSeller != null && selectedPrice != null
                    ? () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addToCart({
                          'name': widget.name,
                          'imageUrl': widget.imageUrls.first,
                          'price': selectedPrice,
                          'seller': selectedSeller,
                        });
                        // 🔥 Store the cart item in Firestore under the current user's ID
                        final user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          final cartItem = {
                            'name': widget.name,
                            'imageUrl': widget.imageUrls.first,
                            'price': selectedPrice,
                            'seller': selectedSeller,
                            'timestamp': FieldValue.serverTimestamp(),
                          };

                          FirebaseFirestore.instance
                              .collection('carts')
                              .doc(user.uid)
                              .collection('items')
                              .add(cartItem);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Added to Cart")),
                        );
                      }
                    : null,
                icon: Icon(Icons.add_shopping_cart),
                label: Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedSeller != null ? Colors.green : Colors.grey,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
