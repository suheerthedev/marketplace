import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  String _password = '';
  String _confirmPassword = '';
  String? _errorMessage;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isFormValid = false;
  String? _email;
  String? _resetToken;

  // Constructor to receive email from verification if needed
  ResetPasswordViewModel() {
    _email = _authService.pendingVerificationEmail;
  }

  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String? get errorMessage => _errorMessage;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  bool get isFormValid => _isFormValid;
  String? get email => _email;

  void setPassword(String value) {
    _password = value;
    _validateForm();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    _validateForm();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setResetToken(String value) {
    _resetToken = value;
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  void _validateForm() {
    _errorMessage = null;

    if (_password.isEmpty || _confirmPassword.isEmpty) {
      _isFormValid = false;
    } else if (_password.length < 6) {
      _errorMessage = 'Password must be at least 6 characters';
      _isFormValid = false;
    } else if (_password != _confirmPassword) {
      _errorMessage = 'Passwords do not match';
      _isFormValid = false;
    } else {
      _isFormValid = true;
    }

    notifyListeners();
  }

  Future<void> resetPassword() async {
    if (!_isFormValid) return;

    // Check if we have the necessary email
    if (_email == null) {
      _errorMessage =
          'Email information is missing. Please go back and try again.';
      notifyListeners();
      return;
    }

    setBusy(true);

    try {
      final success = await _authService.resetPassword(
        _email!,
        _password,
        resetToken: _resetToken,
      );

      if (success) {
        // Show success message and navigate to login
        _navigationService.navigateToBuyerLoginView();
      } else {
        // Show error from auth service
        _errorMessage = _authService.errorMessage ?? 'Failed to reset password';
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred. Please try again.';
    } finally {
      setBusy(false);
    }
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToBuyerLoginView() {
    _navigationService.navigateToBuyerLoginView();
  }
}
