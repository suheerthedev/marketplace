import 'package:flutter/material.dart';
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
    product.isSaved = !product.isSaved;
    notifyListeners();
  }

  void addToCart(Product product, BuildContext context) {
    product.isInCart = true;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Added To Cart Successfully"),
        duration: Duration(seconds: 2),
      ),
    );
    rebuildUi();
  }

  void buyNow(Product product) {
    product.isInCart = true;
    rebuildUi();
    navigationService.navigateToCartView();
  }

  void visitStore() {
    navigationService.navigateToStoreMainView();
  }

  void chat() {
    navigationService.navigateToChatbotView();
  }
}
