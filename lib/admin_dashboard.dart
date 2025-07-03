// import 'package:flutter/material.dart';
// import 'firestore_services.dart';

// class AdminDashboard extends StatefulWidget {
//   @override
//   _AdminDashboardState createState() => _AdminDashboardState();
// }

// class _AdminDashboardState extends State<AdminDashboard> {
//   final FirestoreService _firestoreService = FirestoreService();

//   // Method to approve a seller
//   void approveSeller(String sellerId) {
//     _firestoreService.updateSellerStatus(sellerId, 'Approved');
//   }

//   // Method to reject a seller
//   void rejectSeller(String sellerId) {
//     _firestoreService.updateSellerStatus(sellerId, 'Rejected');
//   }

//   // Method to handle logout
//   void logout() {
//     // Implement logout logic here, for example:
//     // Navigator.pushReplacementNamed(context, '/login');
//     // Or clear any session data if you are using authentication
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text("Logged out successfully!")));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Dashboard'),
//       ),
//       // Add Drawer for side navigation with logout option
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Admin Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app),
//               title: Text('Logout'),
//               onTap: logout,
//             ),
//           ],
//         ),
//       ),
//       body: StreamBuilder<List<Seller>>(
//         stream: _firestoreService.getSellers(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No sellers found."));
//           }

//           final sellers = snapshot.data!;

//           return ListView.builder(
//             itemCount: sellers.length,
//             itemBuilder: (context, index) {
//               final seller = sellers[index];

//               return Card(
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 elevation: 5,
//                 color: Colors.grey[100],
//                 child: ListTile(
//                   title: Text(seller.sellerName,
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Email: ${seller.sellerEmail}"),
//                       Text("Status: ${seller.status}",
//                           style: TextStyle(color: Colors.blue)),
//                       const SizedBox(height: 10),
//                       const Text("Festivals:",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       ...seller.festivals.entries.map((entry) {
//                         final festival = entry.key;
//                         final data = entry.value;
//                         return Text(
//                           "$festival: Can Provide: ${data.canProvide}, Price: ₹${data.price}",
//                           style: TextStyle(color: Colors.black54),
//                         );
//                       }).toList(),
//                     ],
//                   ),
//                   leading: CircleAvatar(
//                       child: Text(seller.sellerName[0].toUpperCase())),
//                   trailing: Text(seller.status,
//                       style: TextStyle(
//                           color: seller.status == 'Pending'
//                               ? Colors.orange
//                               : Colors.green)),
//                   isThreeLine: true,
//                   onLongPress: () {
//                     // Show Approve/Reject options
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: const Text("Choose an Action"),
//                           content: const Text("Approve or Reject the seller."),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 approveSeller(seller.id);
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text("Approve",
//                                   style: TextStyle(color: Colors.green)),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 rejectSeller(seller.id);
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text("Reject",
//                                   style: TextStyle(color: Colors.red)),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'firestore_services.dart';

// ignore: use_key_in_widget_constructors
class AdminDashboard extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final FirestoreService _firestoreService = FirestoreService();

  // Method to approve a seller
  void approveSeller(String sellerId) {
    _firestoreService.updateSellerStatus(sellerId, 'Approved');
  }

  // Method to reject a seller
  void rejectSeller(String sellerId) {
    _firestoreService.updateSellerStatus(sellerId, 'Rejected');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Admin Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Logged out successfully!")));
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<Seller>>(
        stream: _firestoreService.getSellers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No sellers found."));
          }

          final sellers = snapshot.data!;

          return ListView.builder(
            itemCount: sellers.length,
            itemBuilder: (context, index) {
              final seller = sellers[index];

              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                elevation: 5,
                color: Colors.grey[100],
                child: ListTile(
                  title: Text(seller.sellerName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ${seller.sellerEmail}"),
                      Text("Status: ${seller.status}",
                          style: TextStyle(color: Colors.blue)),
                      const SizedBox(height: 10),
                      const Text("Festivals:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      ...seller.festivals.entries.map((entry) {
                        final festival = entry.key;
                        final data = entry.value;
                        return Text(
                          "$festival: Can Provide: ${data.canProvide}, Price: ₹${data.price}",
                          style: TextStyle(color: Colors.black54),
                        );
                        // ignore: unnecessary_to_list_in_spreads
                      }).toList(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: seller.status == 'Pending'
                                ? () => approveSeller(seller.id)
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text("Approve"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: seller.status == 'Pending'
                                ? () => rejectSeller(seller.id)
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text("Reject"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                      child: Text(seller.sellerName[0].toUpperCase())),
                  trailing: Text(seller.status,
                      style: TextStyle(
                          color: seller.status == 'Pending'
                              ? Colors.orange
                              : Colors.green)),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
