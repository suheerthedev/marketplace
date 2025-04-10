import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  final navigationSerivce = locator<NavigationService>();
  final productService = locator<ProductService>();

  List<Product> get products =>
      productService.products.where((product) => product.isInCart).toList();
}
