import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  String _email = '';
  String? _errorMessage;
  bool _isFormValid = false;

  String get email => _email;
  String? get errorMessage => _errorMessage;
  bool get isFormValid => _isFormValid;

  void setEmail(String value) {
    _email = value;
    _validateForm();
  }

  void _validateForm() {
    _errorMessage = null;

    if (_email.isEmpty) {
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

  Future<void> requestPasswordReset() async {
    _navigationService.navigateToVerificationView();
    // if (!_isFormValid) return;

    // setBusy(true);

    // try {
    //   final success = await _authService.requestPasswordReset(_email);

    //   if (success) {
    //     _navigationService.navigateToVerificationView();
    //   } else {
    //     _errorMessage =
    //         _authService.errorMessage ?? 'Failed to request password reset';
    //   }
    // } catch (e) {
    //   _errorMessage = 'An unexpected error occurred. Please try again.';
    // } finally {
    //   setBusy(false);
    // }
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToBuyerLoginView() {
    _navigationService.navigateToBuyerLoginView();
  }
}
