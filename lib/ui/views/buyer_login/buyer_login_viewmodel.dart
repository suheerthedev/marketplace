import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerLoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;
  bool _isFormValid = false;

  // Field-specific error messages
  String? _emailError;
  String? _passwordError;
  String? _generalError;

  String get email => _email;
  String get password => _password;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isFormValid => _isFormValid;

  // Getters for field-specific errors
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  String? get generalError => _generalError;

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

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void _validateForm() {
    // Clear all errors
    _clearErrors();

    if (_email.isEmpty) {
      _isFormValid = false;
    } else if (_password.isEmpty) {
      _isFormValid = false;
    } else if (!_isValidEmail(_email)) {
      _emailError = 'Please enter a valid email address';
      _isFormValid = false;
    } else {
      _isFormValid = true;
    }

    notifyListeners();
  }

  void _clearErrors() {
    _emailError = null;
    _passwordError = null;
    _generalError = null;
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  Future<void> login() async {
    if (!_isFormValid) return;

    _clearErrors();
    setBusy(true);

    try {
      final result = await _authService.login(
        email: _email,
        password: _password,
      );

      switch (result) {
        case AuthResult.success:
          _navigationService.navigateToMainView();
          break;

        case AuthResult.emailNotVerified:
          // Email not verified, navigate to verification view
          _navigationService.navigateToVerificationView();
          break;

        case AuthResult.error:
          // Check for specific error messages from the auth service
          if (_authService.errorMessage != null) {
            // Simple error message handling
            if (_authService.errorMessage!.toLowerCase().contains('email')) {
              _emailError = _authService.errorMessage;
            } else if (_authService.errorMessage!
                .toLowerCase()
                .contains('password')) {
              _passwordError = _authService.errorMessage;
            } else {
              _generalError = _authService.errorMessage;
            }
          } else {
            _generalError = 'Login failed. Please try again.';
          }
          break;
      }
    } catch (e) {
      _generalError = 'An unexpected error occurred. Please try again.';
    } finally {
      setBusy(false);
    }
  }

  void navigateToForgotPassword() {
    _navigationService.navigateToForgotPasswordView();
  }

  void navigateToSignUp() {
    _navigationService.navigateToBuyerSignUpView();
  }

  void loginWithGoogle() async {
    _clearErrors();
    setBusy(true);

    try {
      final success = await _authService.signInWithGoogle();

      if (success) {
        _navigationService.navigateToMainView();
      } else {
        _generalError = _authService.errorMessage ?? 'Google login failed';
      }
    } catch (e) {
      _generalError = 'An unexpected error occurred during Google login';
    } finally {
      setBusy(false);
    }
  }

  void navigateToMainView() {
    _navigationService.navigateToMainView();
  }

  void navigateBack() {
    _navigationService.back();
  }
}
