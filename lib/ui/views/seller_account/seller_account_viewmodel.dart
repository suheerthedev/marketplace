import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';

class SellerAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void openSettings() {
    // Open settings
  }

  void editProfile() {
    // Navigate to edit profile
  }

  void openShopDetails() {
    // Navigate to shop details
  }

  void openPaymentInfo() {
    // Navigate to payment info
  }

  void openShippingSettings() {
    // Navigate to shipping settings
  }

  void openNotifications() {
    // Navigate to notifications
  }

  void openSecurityPrivacy() {
    // Navigate to security & privacy
  }

  void openHelpCenter() {
    // Navigate to help center
  }

  void contactSupport() {
    // Contact support
  }

  void logout() {
    // Logout
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
        _navigationService.navigateToSellerInboxView();
        break;
      case 3:
        // Already on Account
        break;
    }
  }
}
