import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StoreProductsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final ProductService productService = locator<ProductService>();

  List<Product> get products => productService.products;
  void onProductTap(Product product) {
    _navigationService.navigateToProductDetailView(product: product);
  }

  void onSearchTap() {}
  void onCartTap() {}
  void onNotificationTap() {}
  void onFollowTap() {}
}
