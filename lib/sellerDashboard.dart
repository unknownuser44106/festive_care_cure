// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SellerForm extends StatefulWidget {
//   const SellerForm({Key? key}) : super(key: key);

//   @override
//   State<SellerForm> createState() => _SellerFormState();
// }

// class _SellerFormState extends State<SellerForm> {
//   final TextEditingController sellerNameController = TextEditingController();
//   final TextEditingController sellerEmailController = TextEditingController();
//   final Map<String, Map<String, dynamic>> festivalData = {
//     'Ugadi': {'canProvide': false, 'price': 0.0},
//     'Makar Sankranti': {'canProvide': false, 'price': 0.0},
//     'Shivaratri': {'canProvide': false, 'price': 0.0},
//     'Holi': {'canProvide': false, 'price': 0.0},
//     'Diwali': {'canProvide': false, 'price': 0.0},
//     'Bheemana Amavaye': {'canProvide': false, 'price': 0.0},
//     'Ganesha Chaturti': {'canProvide': false, 'price': 0.0},
//     'Rakhi': {'canProvide': false, 'price': 0.0},
//     'Krishna Janmhastami': {'canProvide': false, 'price': 0.0},
//     'Dasara': {'canProvide': false, 'price': 0.0},
//     'Hanuman Jayanti': {'canProvide': false, 'price': 0.0},
//   };

//   Future<void> submitForm() async {
//     try {
//       String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

//       if (uid.isEmpty) {
//         UserCredential userCredential =
//             await FirebaseAuth.instance.signInAnonymously();
//         uid = userCredential.user!.uid;
//       }

//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('seller_items')
//           .where('seller_email', isEqualTo: sellerEmailController.text)
//           .get();

//       if (querySnapshot.docs.isNotEmpty) {
//         // Update existing document if seller exists
//         await FirebaseFirestore.instance
//             .collection('seller_items')
//             .doc(querySnapshot.docs.first.id)
//             .update({
//           'seller_name': sellerNameController.text,
//           'festivals': festivalData,
//           'status': 'Pending',
//           'updated_at': FieldValue.serverTimestamp(),
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Data updated successfully!")),
//         );
//       } else {
//         // Create a new document if seller doesn't exist
//         await FirebaseFirestore.instance
//             .collection('seller_items')
//             .doc(uid)
//             .set({
//           'seller_name': sellerNameController.text,
//           'seller_email': sellerEmailController.text,
//           'festivals': festivalData,
//           'status': 'Pending',
//           'created_at': FieldValue.serverTimestamp(),
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Request submitted successfully!")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }

//   Future<String> checkStatus() async {
//     try {
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('seller_items')
//           .where('seller_email', isEqualTo: sellerEmailController.text)
//           .get();

//       if (querySnapshot.docs.isNotEmpty) {
//         return querySnapshot.docs.first['status'] ?? 'Pending';
//       }
//       return 'No Request Found';
//     } catch (e) {
//       return 'Error: $e';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Festival Essentials Form')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Text('Seller Dashboard',
//                   style: TextStyle(color: Colors.white, fontSize: 24)),
//             ),
//             ListTile(
//               leading: Icon(Icons.check_circle_outline),
//               title: Text('Check Status'),
//               onTap: () async {
//                 final status = await checkStatus();
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Status: $status")),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () async {
//                 await FirebaseAuth.instance.signOut();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Logged out successfully!")),
//                 );
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextField(
//               controller: sellerNameController,
//               decoration: const InputDecoration(labelText: 'Seller Name'),
//             ),
//             TextField(
//               controller: sellerEmailController,
//               decoration: const InputDecoration(labelText: 'Seller Email'),
//             ),
//             const SizedBox(height: 20),
//             const Text("Select Festivals You Provide Essentials For:"),
//             ...festivalData.entries.map((entry) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: entry.value['canProvide'],
//                         onChanged: (bool? value) {
//                           setState(() {
//                             entry.value['canProvide'] = value ?? false;
//                           });
//                         },
//                       ),
//                       Text(entry.key),
//                     ],
//                   ),
//                   if (entry.value['canProvide'])
//                     TextField(
//                       keyboardType: TextInputType.number,
//                       onChanged: (value) {
//                         setState(() {
//                           entry.value['price'] = double.tryParse(value) ?? 0.0;
//                         });
//                       },
//                       decoration: const InputDecoration(
//                         labelText: 'Enter Combo Price',
//                       ),
//                     ),
//                 ],
//               );
//             }).toList(),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: submitForm,
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SellerForm extends StatefulWidget {
  const SellerForm({Key? key}) : super(key: key);

  @override
  State<SellerForm> createState() => _SellerFormState();
}

class _SellerFormState extends State<SellerForm> {
  final TextEditingController sellerNameController = TextEditingController();
  final TextEditingController sellerEmailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Map<String, Map<String, dynamic>> festivalData = {
    'Ugadi': {'canProvide': false, 'price': 0.0},
    'Makar Sankranti': {'canProvide': false, 'price': 0.0},
    'Shivaratri': {'canProvide': false, 'price': 0.0},
    'Holi': {'canProvide': false, 'price': 0.0},
    'Diwali': {'canProvide': false, 'price': 0.0},
    'Bheemana Amavaye': {'canProvide': false, 'price': 0.0},
    'Ganesha Chaturti': {'canProvide': false, 'price': 0.0},
    'Rakhi': {'canProvide': false, 'price': 0.0},
    'Krishna Janmhastami': {'canProvide': false, 'price': 0.0},
    'Dasara': {'canProvide': false, 'price': 0.0},
    'Hanuman Jayanti': {'canProvide': false, 'price': 0.0},
  };

  Future<void> submitForm() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        UserCredential userCredential = await _auth.signInAnonymously();
        user = userCredential.user;
      }

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Authentication failed!")),
        );
        return;
      }

      String uid = user.uid;

      // Check if the seller document already exists
      final docRef = _firestore.collection('seller_items').doc(uid);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Update existing document
        await docRef.update({
          'seller_name': sellerNameController.text,
          'festivals': festivalData,
          'status': 'Pending',
          'updated_at': FieldValue.serverTimestamp(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data updated successfully!")),
        );
      } else {
        // Create a new document
        await docRef.set({
          'seller_name': sellerNameController.text,
          'seller_email': sellerEmailController.text,
          'festivals': festivalData,
          'status': 'Pending',
          'created_at': FieldValue.serverTimestamp(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Request submitted successfully!")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  Future<String> checkStatus() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        return 'Not Logged In';
      }

      String uid = user.uid;

      final docSnapshot =
          await _firestore.collection('seller_items').doc(uid).get();

      if (docSnapshot.exists) {
        return docSnapshot.data()?['status'] ?? 'Pending';
      }
      return 'No Request Found';
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Festival Essentials Form')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Seller Dashboard',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Check Status'),
              onTap: () async {
                final status = await checkStatus();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Status: $status")),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await _auth.signOut();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logged out successfully!")),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: sellerNameController,
              decoration: const InputDecoration(labelText: 'Seller Name'),
            ),
            TextField(
              controller: sellerEmailController,
              decoration: const InputDecoration(labelText: 'Seller Email'),
            ),
            const SizedBox(height: 20),
            const Text("Select Festivals You Provide Essentials For:"),
            ...festivalData.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: entry.value['canProvide'],
                        onChanged: (bool? value) {
                          setState(() {
                            entry.value['canProvide'] = value ?? false;
                          });
                        },
                      ),
                      Text(entry.key),
                    ],
                  ),
                  if (entry.value['canProvide'])
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          entry.value['price'] = double.tryParse(value) ?? 0.0;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Enter Combo Price',
                      ),
                    ),
                ],
              );
            }).toList(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
