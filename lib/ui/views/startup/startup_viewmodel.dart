import 'package:stacked/stacked.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:marketplace/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // Show splash screen for minimum time
    await Future.delayed(const Duration(seconds: 2));

    // Initialize user service to load any saved user data
    await _userService.initialize();

    // Check if we have a user session
    if (_userService.hasUser) {
      // Navigate to the main view if user is logged in
      _navigationService.navigateToMainView();
    } else {
      // Navigate to the buyer signup view if no user is logged in
    }
  }

  void navigateToBuyerSignUpView() {
    _navigationService.navigateToBuyerSignUpView();
  }

  void navigateToSellerSignUpView() {
    _navigationService.navigateToSellerSignUpView();
  }
}
