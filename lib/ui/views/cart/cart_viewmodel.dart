import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final productService = locator<ProductService>();

  List<Product> get products =>
      productService.products.where((product) => product.isInCart).toList();

  // Cart Totals
  double get subtotal => products.fold(0,
      (sum, product) => sum + (product.price * getProductQuantity(product.id)));

  double get shippingFee => products.isEmpty ? 0 : 80.0;
  double get vat => 0.0; // Can be calculated based on your requirements
  double get total => subtotal + shippingFee + vat;

  // Quantity Management
  final Map<String, int> _quantities = {};

  int getProductQuantity(String productId) {
    return _quantities[productId] ?? 1;
  }

  void incrementQuantity(String productId) {
    _quantities[productId] = getProductQuantity(productId) + 1;
    notifyListeners();
  }

  void decrementQuantity(String productId) {
    if (getProductQuantity(productId) > 1) {
      _quantities[productId] = getProductQuantity(productId) - 1;
      notifyListeners();
    }
  }

  // Cart Actions
  void removeFromCart(String productId) {
    var product = products.firstWhere((p) => p.id == productId);
    product.isInCart = false;
    _quantities.remove(productId);
    notifyListeners();
  }

  void proceedToCheckout() {
    // Navigate to checkout view
    // navigationService.navigateToCheckoutView();
  }

  void continueShopping() {
    navigationService.navigateToHomeView();
  }
}
