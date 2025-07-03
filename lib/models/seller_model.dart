// seller_model.dart

class SellerItem {
  final String sellerName;
  final double price;

  SellerItem({
    required this.sellerName,
    required this.price,
  });

  factory SellerItem.fromMap(Map<String, dynamic> data) {
    return SellerItem(
      sellerName: data['seller_name'],
      price: (data['price'] as num).toDouble(),
    );
  }
}
