import 'package:marketplace/app/app.dialogs.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';

class SellerProductsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
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

  void onSelected(String value, int index) {
    if (value == 'edit') {
      editProduct(index);
    } else if (value == 'delete') {
      deleteProduct(index);
    }
  }

  void editProduct(int index) {
    //Handle edit product
  }

  void deleteProduct(int index) {
    _dialogService.showCustomDialog(
        variant: DialogType.confirmation,
        title: "Are you sure you want to delete this product?",
        mainButtonTitle: 'Delete',
        secondaryButtonTitle: 'Cancel');
  }
}
