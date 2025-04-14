import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum PaymentMethod { card, cod }

class CheckoutViewModel extends BaseViewModel {
  final _navigationSerivce = locator<NavigationService>();
  bool _emailNewsletter = false;
  bool _saveInformation = false;
  PaymentMethod _paymentMethod = PaymentMethod.card;

  bool get emailNewsletter => _emailNewsletter;
  bool get saveInformation => _saveInformation;
  PaymentMethod get paymentMethod => _paymentMethod;

  void setEmailNewsletter(bool value) {
    _emailNewsletter = value;
    notifyListeners();
  }

  void setSaveInformation(bool value) {
    _saveInformation = value;
    notifyListeners();
  }

  void setPaymentMethod(PaymentMethod method) {
    _paymentMethod = method;
    notifyListeners();
  }

  void proceedToPay() {
    _navigationSerivce.navigateToPayNowView();
  }
}
