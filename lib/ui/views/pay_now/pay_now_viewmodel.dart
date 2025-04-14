import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/models/saved_card.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PayNowViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String _cardNumber = '';
  String _expiryDate = '';
  String _cvc = '';

  bool _isCardNumberValid = false;
  bool _isExpiryDateValid = false;
  bool _isCvcValid = false;

  List<SavedCard> _savedCards = [
    SavedCard(
      id: '1',
      name: 'Amna Saleem',
      number: '1234567812345678',
      date: '06/24',
      paymentType: 'Apple Pay',
    ),
    SavedCard(
      id: '2',
      name: 'Amna Saleem',
      number: '1234567812345678',
      date: '06/24',
      paymentType: 'Apple Pay',
    ),
  ];

  String get cardNumber => _cardNumber;
  String get expiryDate => _expiryDate;
  String get cvc => _cvc;

  bool get isCardNumberValid => _isCardNumberValid;
  bool get isExpiryDateValid => _isExpiryDateValid;
  bool get isCvcValid => _isCvcValid;

  List<SavedCard> get savedCards => _savedCards;

  void setCardNumber(String value) {
    _cardNumber = value;
    _validateCardNumber();
    notifyListeners();
  }

  void setExpiryDate(String value) {
    _expiryDate = value;
    _validateExpiryDate();
    notifyListeners();
  }

  void setCvc(String value) {
    _cvc = value;
    _validateCvc();
    notifyListeners();
  }

  void _validateCardNumber() {
    // Simple validation - checking if the entered value is a valid email for demo purposes
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    _isCardNumberValid = emailRegex.hasMatch(_cardNumber);
  }

  void _validateExpiryDate() {
    // Check if format is MM/YY and date is not expired
    if (_expiryDate.length != 5) {
      _isExpiryDateValid = false;
      return;
    }

    final parts = _expiryDate.split('/');
    if (parts.length != 2) {
      _isExpiryDateValid = false;
      return;
    }

    int? month = int.tryParse(parts[0]);
    int? year = int.tryParse(parts[1]);

    if (month == null || year == null || month < 1 || month > 12) {
      _isExpiryDateValid = false;
      return;
    }

    // Add 2000 to convert YY to 20YY
    year += 2000;

    final now = DateTime.now();
    final cardDate = DateTime(year, month);

    _isExpiryDateValid = cardDate.isAfter(now);
  }

  void _validateCvc() {
    // Check if CVC is 3 or 4 digits
    _isCvcValid =
        _cvc.length >= 3 && _cvc.length <= 4 && int.tryParse(_cvc) != null;
  }

  void selectCard(String id) {
    _savedCards = _savedCards.map((card) {
      return card.copyWith(isSelected: card.id == id);
    }).toList();
    notifyListeners();
  }

  void pay() {
    // Implement payment logic
    _navigationService.navigateToConfirmationView();
  }
}
