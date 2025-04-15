import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/widgets/common/product_review_card/product_review_card_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerToReviewViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final List<ProductForReview> _productsToReview = [
    ProductForReview(
      id: '1',
      storeName: 'Store Name',
      productName: 'Product name/description',
      imageUrl: 'assets/images/placeholder.png',
      subtotal: 170,
    ),
    ProductForReview(
      id: '2',
      storeName: 'Store Name',
      productName: 'Product name/description',
      imageUrl: 'assets/images/placeholder.png',
      subtotal: 170,
    ),
  ];

  List<ProductForReview> get productsToReview => _productsToReview;

  void navigateToWriteReview(String productId) {
    // In a real app, this would navigate to the write review screen
    _navigationService.navigateToWriteReviewView();

    // For now, just log the action

    print('Navigate to write review for product: $productId');
  }
}
