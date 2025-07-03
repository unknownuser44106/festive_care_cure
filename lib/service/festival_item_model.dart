import 'package:cloud_firestore/cloud_firestore.dart';

class FestivalItem {
  final String festivalName;
  final double price;
  final String sellerName;

  FestivalItem({
    required this.festivalName,
    required this.price,
    required this.sellerName,
  });

  factory FestivalItem.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    List<FestivalItem> festivalItems = [];

    data['festivals']?.forEach((festivalName, festivalDetails) {
      if (festivalDetails['canProvide'] == true &&
          festivalDetails['price'] != null) {
        festivalItems.add(FestivalItem(
          festivalName: festivalName,
          price: (festivalDetails['price'] ?? 0.0).toDouble(),
          sellerName: data['seller_name'] ?? 'Unknown Seller',
        ));
      }
    });

    // You cannot return a list here; must be handled outside
    throw UnimplementedError(
        'This factory returns a list. Use a service instead.');
  }

  // Helper method to parse multiple items from doc
  static List<FestivalItem> extractFestivals(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    List<FestivalItem> festivalItems = [];

    data['festivals']?.forEach((festivalName, festivalDetails) {
      if (festivalDetails['canProvide'] == true &&
          festivalDetails['price'] != null) {
        festivalItems.add(FestivalItem(
          festivalName: festivalName,
          price: (festivalDetails['price'] ?? 0.0).toDouble(),
          sellerName: data['seller_name'] ?? 'Unknown Seller',
        ));
      }
    });

    return festivalItems;
  }
}

class ItemService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<FestivalItem>> getApprovedFestivals() async {
    try {
      QuerySnapshot snapshot = await _db
          .collection('sellers_items')
          .where('status', isEqualTo: 'Approved')
          .get();

      List<FestivalItem> allItems = [];

      for (var doc in snapshot.docs) {
        allItems.addAll(FestivalItem.extractFestivals(doc));
      }

      return allItems;
    } catch (e) {
      print("Error fetching approved festivals: $e");
      return [];
    }
  }
}
