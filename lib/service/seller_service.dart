// seller_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festive_care_cure/models/seller_model.dart';

class SellerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<SellerItem>> fetchApprovedSellersForFestival(
      String festivalName) async {
    final querySnapshot = await _firestore
        .collection('sellers_items')
        .where('festival_name', isEqualTo: festivalName)
        .where('status', isEqualTo: 'approved')
        .get();

    return querySnapshot.docs
        .map((doc) => SellerItem.fromMap(doc.data()))
        .toList();
  }
}
