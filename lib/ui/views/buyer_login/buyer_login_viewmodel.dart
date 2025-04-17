import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerLoginViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  String _email = '';
  String _password = '';
  String? _errorMessage;
  bool _isPasswordVisible = false;
  bool _isFormValid = false;

  String get email => _email;
  String get password => _password;
  String? get errorMessage => _errorMessage;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isFormValid => _isFormValid;

  void setEmail(String value) {
    _email = value;
    _validateForm();
  }

  void setPassword(String value) {
    _password = value;
    _validateForm();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void _validateForm() {
    _errorMessage = null;

    if (_email.isEmpty || _password.isEmpty) {
      _isFormValid = false;
    } else if (!_isValidEmail(_email)) {
      _errorMessage = 'Please enter a valid email address';
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

  Future<void> login() async {
    if (!_isFormValid) return;

    setBusy(true);

    try {
      final success = await _authService.login(
          email: _email, password: _password, userType: 'buyer');

      if (success) {
        navigationService.navigateToMainView();
      } else {
        _errorMessage = _authService.error ??
            'Login failed. Please check your credentials.';
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    } finally {
      setBusy(false);
    }
  }

  Future<void> loginWithGoogle() async {
    setBusy(true);

    try {
      final success = await _authService.signInWithGoogle();

      if (success) {
        navigationService.navigateToMainView();
      } else {
        _errorMessage = _authService.error ?? 'Google sign in failed';
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    } finally {
      setBusy(false);
    }
  }
}
