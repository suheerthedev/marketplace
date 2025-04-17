import 'package:marketplace/app/app.dialogs.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../common/app_strings.dart';

class BuyerSignUpViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _country = 'Pakistan'; // Default value
  String _phoneNumber = '';
  bool _newsletterSubscription = true; // Default to true
  bool _isPasswordVisible = false;
  bool _isFormValid = false;

  // Field-specific error messages
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _phoneNumberError;
  String? _generalError;

  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get country => _country;
  String get phoneNumber => _phoneNumber;
  bool get newsletterSubscription => _newsletterSubscription;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isFormValid => _isFormValid;

  // Getters for field-specific errors
  String? get nameError => _nameError;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  String? get phoneNumberError => _phoneNumberError;
  String? get generalError => _generalError;

  void setName(String value) {
    _name = value;
    _nameError = null; // Clear error when field changes
    _validateForm();
  }

  void setEmail(String value) {
    _email = value;
    _emailError = null; // Clear error when field changes
    _validateForm();
  }

  void setPassword(String value) {
    _password = value;
    _passwordError = null; // Clear error when field changes
    _validateForm();
  }

  void setCountry(String value) {
    _country = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    _phoneNumberError = null; // Clear error when field changes
    _validateForm();
  }

  void setNewsletterSubscription(bool value) {
    _newsletterSubscription = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void _validateForm() {
    // Clear all errors first
    _clearErrors();

    // Check for empty fields
    if (_name.isEmpty) {
      _isFormValid = false;
    } else if (_email.isEmpty) {
      _isFormValid = false;
    } else if (_password.isEmpty) {
      _isFormValid = false;
    } else if (_phoneNumber.isEmpty) {
      _isFormValid = false;
    }
    // Validate email format
    else if (!_isValidEmail(_email)) {
      _emailError = 'Please enter a valid email address';
      _isFormValid = false;
    }
    // Validate password length
    else if (_password.length < 6) {
      _passwordError = 'Password must be at least 6 characters';
      _isFormValid = false;
    }
    // Validate phone number format
    else if (!_isValidPhoneNumber(_phoneNumber)) {
      _phoneNumberError = 'Please enter a valid phone number';
      _isFormValid = false;
    } else {
      _isFormValid = true;
    }

    notifyListeners();
  }

  void _clearErrors() {
    _nameError = null;
    _emailError = null;
    _passwordError = null;
    _phoneNumberError = null;
    _generalError = null;
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
    _clearErrors();
    setBusy(true);

    try {
      final success = await _authService.signUpBuyer(
        name: _name,
        email: _email,
        password: _password,
        phoneNumber: _phoneNumber,
        country: _country,
        newsletterSubscription: _newsletterSubscription,
      );

      if (success) {
        navigationService.navigateToVerificationView();
      } else {
        // Map API validation errors to specific fields
        if (_authService.validationErrors.isNotEmpty) {
          _processValidationErrors(_authService.validationErrors);
        } else if (_authService.error != null) {
          _generalError = _authService.error;
        }
      }
    } catch (e) {
      _generalError = 'An unexpected error occurred. Please try again.';
    } finally {
      setBusy(false);
    }
  }

  void _processValidationErrors(Map<String, String> errors) {
    // Map API error keys to our form fields
    errors.forEach((key, value) {
      switch (key.toLowerCase()) {
        case 'name':
        case 'first_name':
        case 'lastname':
        case 'last_name':
          _nameError = value;
          break;
        case 'email':
          _emailError = value;
          break;
        case 'password':
          _passwordError = value;
          break;
        case 'phone':
        case 'phone_number':
        case 'phonenumber':
          _phoneNumberError = value;
          break;
        default:
          // If we don't have a specific field for this error, set it as general error
          _generalError = value;
      }
    });
  }

  Future<void> signUpWithGoogle() async {
    _clearErrors();
    setBusy(true);

    try {
      final success = await _authService.signInWithGoogle();

      if (success) {
        navigationService.navigateToMainView();
      } else {
        _generalError = _authService.error ??
            'Failed to sign in with Google. Please try again.';
      }
    } catch (e) {
      _generalError = 'An unexpected error occurred. Please try again later.';
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
