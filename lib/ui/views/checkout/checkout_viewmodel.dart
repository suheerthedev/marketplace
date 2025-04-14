import 'package:stacked/stacked.dart';

enum PaymentMethod { card, cod }

class CheckoutViewModel extends BaseViewModel {
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
}
