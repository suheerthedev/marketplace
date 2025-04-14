import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';

class SellerDashboardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToNotifications() {
    // Navigate to notifications
  }

  void navigateToOrders() {
    // Navigate to orders view
  }

  void navigateToProducts() {
    _navigationService.navigateToSellerProductsView();
  }

  void addNewProduct() {
    _navigationService.navigateToSellerAddProductView();
  }
}
