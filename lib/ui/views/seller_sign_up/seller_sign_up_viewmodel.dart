import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SellerSignUpViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _address = '';
  String _phoneNumber = '';
  String? _errorMessage;
  bool _isPasswordVisible = false;
  bool _isFormValid = false;

  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get address => _address;
  String get phoneNumber => _phoneNumber;
  String? get errorMessage => _errorMessage;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isFormValid => _isFormValid;

  void setName(String value) {
    _name = value;
    _validateForm();
  }

  void setAddress(String value) {
    _address = value;
    _validateForm();
  }

  void setEmail(String value) {
    _email = value;
    _validateForm();
  }

  void setPassword(String value) {
    _password = value;
    _validateForm();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    _validateForm();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void _validateForm() {
    _errorMessage = null;

    if (_name.isEmpty ||
        _email.isEmpty ||
        _password.isEmpty ||
        _address.isEmpty ||
        _phoneNumber.isEmpty) {
      _isFormValid = false;
    } else if (!_isValidEmail(_email)) {
      _errorMessage = 'Please enter a valid email address';
      _isFormValid = false;
    } else if (_password.length < 6) {
      _errorMessage = 'Password must be at least 6 characters';
      _isFormValid = false;
    } else if (!_isValidPhoneNumber(_phoneNumber)) {
      _errorMessage = 'Please enter a valid phone number';
      _isFormValid = false;
    } else {
      _isFormValid = true;
    }

    notifyListeners();
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    // Basic validation for international phone numbers
    // Allows +, spaces, and digits, minimum 10 digits
    final phoneRegExp = RegExp(r'^\+?[0-9\s]{10,15}$');
    return phoneRegExp.hasMatch(phoneNumber.replaceAll(RegExp(r'[-()\s]'), ''));
  }

  Future<void> signUp() async {
    // if (!_isFormValid) return;

    // setBusy(true);

    // try {
    //   final success = await _authService.signUpSeller(
    //     name: _name,
    //     email: _email,
    //     password: _password,
    //     address: _address,
    //     phoneNumber: _phoneNumber,
    //   );

    //   if (success) {
    //     navigationService.navigateToVerificationView();
    //   } else {
    //     _errorMessage = _authService.error ?? 'Sign up failed';
    //   }
    // } catch (e) {
    //   _errorMessage = 'An unexpected error occurred';
    // } finally {
    //   setBusy(false);
    // }
  }

  Future<void> signUpWithGoogle() async {
    setBusy(true);

    try {
      final success = await _authService.signInWithGoogle();

      if (success) {
        navigationService.navigateTo(Routes.sellerMainView);
      } else {
        _errorMessage = _authService.errorMessage ?? 'Google sign in failed';
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    } finally {
      setBusy(false);
    }
  }

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
