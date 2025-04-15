import 'package:stacked/stacked.dart';

class BuyerToReceiveViewModel extends BaseViewModel {
  final List<Map<String, dynamic>> _productsToReceive = [
    {
      'id': '1',
      'storeName': 'Store Name',
      'productName': 'Product name/description',
      'productDescription': 'Product name/description',
      'subtotal': 170,
      'quantity': 1,
      'deliveryDate': '22-feb-2025',
      'image': 'https://via.placeholder.com/80',
    },
    {
      'id': '2',
      'storeName': 'Store Name',
      'productName': 'Product name/description',
      'productDescription': 'Product name/description',
      'subtotal': 170,
      'quantity': 1,
      'deliveryDate': '22-feb-2025',
      'image': 'https://via.placeholder.com/80',
    },
  ];

  List<Map<String, dynamic>> get productsToReceive => _productsToReceive;

  void onProductTap(String productId) {
    // Navigate to product details
    print('Product tapped: $productId');
  }

  void onWriteReviewTap(String productId) {
    // Navigate to write review screen
    print('Write review for product: $productId');
  }
}
