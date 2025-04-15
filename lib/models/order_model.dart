class Order {
  final String id;
  final String productName;
  final double price;
  final String imageUrl;
  final String status;
  final String? deliveryDate;

  Order({
    required this.id,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.status,
    this.deliveryDate,
  });

  bool get isDelivered => deliveryDate != null;
}
