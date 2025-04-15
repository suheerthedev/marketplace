import 'package:stacked/stacked.dart';

class ProductForReview {
  final String id;
  final String storeName;
  final String productName;
  final String imageUrl;
  final double subtotal;

  ProductForReview({
    required this.id,
    required this.storeName,
    required this.productName,
    required this.imageUrl,
    required this.subtotal,
  });
}

class ProductReviewCardModel extends BaseViewModel {
  final ProductForReview _product;
  final Function(String) _onWriteReview;

  ProductReviewCardModel({
    required ProductForReview product,
    required Function(String) onWriteReview,
  })  : _product = product,
        _onWriteReview = onWriteReview;

  ProductForReview get product => _product;

  void writeReview() {
    _onWriteReview(_product.id);
  }
}
