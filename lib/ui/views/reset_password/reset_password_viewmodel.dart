import 'package:marketplace/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final navigationSerivce = locator<NavigationService>();

  void navigateToLogin() {
    navigationSerivce.back();
    navigationSerivce.back();
  }
}
