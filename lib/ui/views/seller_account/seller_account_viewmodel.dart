import 'package:marketplace/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.locator.dart';

class SellerAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool _notificationsEnabled = true; // Default value

  bool get notificationsEnabled => _notificationsEnabled;

  void openSettings() {
    // Open settings
  }

  void editProfile() {
    // Navigate to edit profile
  }

  void openSellerProfile() {
    // Navigate to shop details
    _navigationService.navigateToSellerProfileView();
  }

  void openSellerWallet() {
    // Navigate to payment info
    _navigationService.navigateToSellerMyWalletView();
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
    _navigationService.navigateToSellerHelpCenterView();
  }

  void contactSupport() {
    // Contact support
  }

  void logout() {
    // Logout
  }

  void toggleNotifications(bool value) {
    _notificationsEnabled = value; // Update the state
    notifyListeners(); // Notify listeners to rebuild the UI
  }

  void toggleEmailNotifications() {
    // Toggle email notifications
  }
}
