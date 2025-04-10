import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final ProductService productService = locator<ProductService>();

  String selectedSize = 'S';

  void onToggleSaved(Product product) {
    productService.toggleSavedStatus(product.id);
    rebuildUi();
  }

  void addToCart(Product product) {
    product.isInCart = true;
    rebuildUi();
    navigationService.back();
  }

  void buyNow(Product product) {
    product.isInCart = true;
    rebuildUi();
    navigationService.navigateToCartView();
  }
}
