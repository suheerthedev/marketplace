import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerSignUpViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  void onTermsAndConditionsTap() {
    navigationService.navigateToTermsConditonsView();
  }

  void onPrivacyPolicyTap() {
    navigationService.navigateToPrivacyPolicyView();
  }

  void onCookieUseTap() {
    navigationService.navigateToPrivacyPolicyView();
  }
}
