import 'package:stacked/stacked.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class SavedViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final productService = locator<ProductService>();

  List<Product> get savedProducts =>
      productService.products.where((product) => product.isSaved).toList();

  void toggleSaved(Product product) {
    product.isSaved = !product.isSaved;
    notifyListeners();
  }
}
