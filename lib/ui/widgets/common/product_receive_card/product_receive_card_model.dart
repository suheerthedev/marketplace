import 'package:stacked/stacked.dart';

class ProductToReceive {
  final String id;
  final String storeName;
  final String productName;
  final String? productDescription;
  final double subtotal;
  final int quantity;
  final String expectedDeliveryDate;
  final String? imageUrl;

  ProductToReceive({
    required this.id,
    required this.storeName,
    required this.productName,
    this.productDescription,
    required this.subtotal,
    required this.quantity,
    required this.expectedDeliveryDate,
    this.imageUrl,
  });
}

class ProductReceiveCardModel extends BaseViewModel {
  final ProductToReceive _product;

  ProductReceiveCardModel({
    required ProductToReceive product,
  }) : _product = product;

  ProductToReceive get product => _product;
}
