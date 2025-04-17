import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  String _password = '';
  String _confirmPassword = '';
  String? _errorMessage;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isFormValid = false;

  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String? get errorMessage => _errorMessage;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  bool get isFormValid => _isFormValid;

  void setPassword(String value) {
    _password = value;
    _validateForm();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    _validateForm();
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

    setBusy(true);

    try {
      // In a real app, you would pass the email from previous screens
      // For this example, we'll use a placeholder
      final success =
          await _authService.resetPassword('user@example.com', _password);

      if (success) {
        navigationService.navigateToBuyerLoginView();
      } else {
        _errorMessage = _authService.error ?? 'Failed to reset password';
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    } finally {
      setBusy(false);
    }
  }
}
