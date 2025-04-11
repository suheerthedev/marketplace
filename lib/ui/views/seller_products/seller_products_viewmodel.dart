import 'package:marketplace/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';

class SellerProductsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final productService = locator<ProductService>();
  List get products => productService.products;

  void searchProducts() {
    // Implement search functionality
  }

  void addNewProduct() {
    // Navigate to add product screen
  }

  void viewProductDetails(int index) {
    // Navigate to product details
  }

  void navigateToIndex(int index) {
    switch (index) {
      case 0:
        _navigationService.navigateToSellerDashboardView();
        break;
      case 1:
        // Already on Products
        break;
      case 2:
        _navigationService.navigateToSellerInboxView();
        break;
      case 3:
        _navigationService.navigateToSellerAccountView();
        break;
    }
  }
}
