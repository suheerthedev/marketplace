import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';

class SellerInboxViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void searchMessages() {
    // Implement search functionality
  }

  void openChat(int index) {
    // Navigate to chat screen
  }

  void navigateToIndex(int index) {
    switch (index) {
      case 0:
        _navigationService.navigateToSellerDashboardView();
        break;
      case 1:
        _navigationService.navigateToSellerProductsView();
        break;
      case 2:
        // Already on Inbox
        break;
      case 3:
        _navigationService.navigateToSellerAccountView();
        break;
    }
  }
}
