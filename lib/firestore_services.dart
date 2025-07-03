// import 'package:cloud_firestore/cloud_firestore.dart';

// // FirestoreService to handle Firestore interactions
// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   // Fetch sellers' data from 'seller_items' collection
//   Stream<List<Seller>> getSellers() {
//     return _db.collection('seller_items').snapshots().map((snapshot) =>
//         snapshot.docs.map((doc) => Seller.fromFirestore(doc.data())).toList());
//   }

//   // Update seller status (approve/reject)
//   Future<void> updateSellerStatus(String sellerId, String status) async {
//     try {
//       await _db.collection('seller_items').doc(sellerId).update({
//         'status': status,
//       });
//     } catch (e) {
//       print("Error updating seller status: $e");
//     }
//   }
// }

// // Seller model to convert Firestore data into a usable object
// class Seller {
//   final String id;
//   final String sellerEmail;
//   final String sellerName;
//   final String status;
//   final Map<String, Festival> festivals;

//   Seller({
//     required this.id,
//     required this.sellerEmail,
//     required this.sellerName,
//     required this.status,
//     required this.festivals,
//   });

//   // Factory method to create a Seller object from Firestore document
//   factory Seller.fromFirestore(Map<String, dynamic> firestore) {
//     var festivalsData = firestore['festivals'] as Map<String, dynamic>;

//     Map<String, Festival> festivalMap = {};
//     festivalsData.forEach((key, value) {
//       festivalMap[key] = Festival.fromMap(value);
//     });

//     return Seller(
//       id: firestore['id'] ?? '',
//       sellerEmail: firestore['seller_email'] ?? '',
//       sellerName: firestore['seller_name'] ?? '',
//       status: firestore['status'] ?? 'pending',
//       festivals: festivalMap,
//     );
//   }

//   get ipAddress => null;
// }

// // Festival model to hold festival data (canProvide, price)
// class Festival {
//   final bool canProvide;
//   final int price;

//   Festival({required this.canProvide, required this.price});

//   // Convert festival map to Festival object
//   factory Festival.fromMap(Map<String, dynamic> festivalData) {
//     return Festival(
//       canProvide: festivalData['canProvide'] ?? false,
//       price: festivalData['price'] ?? 0,
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

// FirestoreService to handle Firestore interactions
class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch sellers' data
  Stream<List<Seller>> getSellers() {
    return _db.collection('seller_items').snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => Seller.fromFirestore(doc.id, doc.data()))
        .toList());
  }

  // Update seller status (approve/reject)
  Future<void> updateSellerStatus(String sellerId, String status) async {
    await _db.collection('seller_items').doc(sellerId).update({
      'status': status,
    });
  }
}

// Seller model to convert Firestore data into a usable object
class Seller {
  final String id;
  final String sellerName;
  final String sellerEmail;
  final String status;
  final Map<String, FestivalData> festivals;

  Seller({
    required this.id,
    required this.sellerName,
    required this.sellerEmail,
    required this.status,
    required this.festivals,
  });

  // Factory method to create a Seller object from Firestore document
  factory Seller.fromFirestore(String id, Map<String, dynamic> firestore) {
    Map<String, dynamic> festivalMap = firestore['festivals'] ?? {};
    Map<String, FestivalData> festivals = {};

    festivalMap.forEach((key, value) {
      festivals[key] = FestivalData(
        canProvide: value['canProvide'] ?? false,
        price: (value['price'] ?? 0).toDouble(),
      );
    });

    return Seller(
      id: id,
      sellerName: firestore['seller_name'] ?? '',
      sellerEmail: firestore['seller_email'] ?? '',
      status: firestore['status'] ?? 'Pending',
      festivals: festivals,
    );
  }
}

class FestivalData {
  final bool canProvide;
  final double price;

  FestivalData({required this.canProvide, required this.price});
}
