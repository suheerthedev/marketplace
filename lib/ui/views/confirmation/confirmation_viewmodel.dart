import 'package:marketplace/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConfirmationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void confimed() {
    _navigationService.back();
    _navigationService.back();
    _navigationService.back();
  }
}
