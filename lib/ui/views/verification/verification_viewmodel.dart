import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerificationViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  String _verificationCode = '';
  String? _errorMessage;
  bool _isFormValid = false;
  String? _email;

  String get verificationCode => _verificationCode;
  String? get errorMessage => _errorMessage;
  bool get isFormValid => _isFormValid;
  String? get email => _email ?? _authService.pendingVerificationEmail;

  // Initialize email on construction
  VerificationViewModel() {
    _email = _authService.pendingVerificationEmail;

    if (_email == null) {
      // If no email is available, show error
      _errorMessage =
          'No email address found for verification. Please go back and try registering again.';
    }
  }

  void setVerificationCode(String value) {
    _verificationCode = value;
    _validateForm();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void _validateForm() {
    _errorMessage = null;

    if (_verificationCode.isEmpty) {
      _isFormValid = false;
    } else if (_verificationCode.length != 6) {
      _errorMessage = 'Please enter a 6-digit verification code';
      _isFormValid = false;
    } else {
      _isFormValid = true;
    }

    notifyListeners();
  }

  Future<void> verifyCode() async {
    if (!_isFormValid || email == null) return;

    setBusy(true);

    try {
      final success = await _authService.verifyOTP(email!, _verificationCode);

      if (success) {
        // After successful verification, navigate to login
        navigationService.navigateToBuyerLoginView();
      } else {
        _errorMessage = _authService.error ?? 'Invalid verification code';
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    } finally {
      setBusy(false);
    }
  }

  Future<void> resendCode() async {
    if (email == null) {
      _errorMessage = 'No email address found for verification.';
      notifyListeners();
      return;
    }

    setBusy(true);

    try {
      final success = await _authService.resendOTP(email!);

      if (success) {
        _errorMessage = 'Verification code resent successfully!';
      } else {
        _errorMessage =
            _authService.error ?? 'Failed to resend verification code';
      }
    } catch (e) {
      _errorMessage =
          'An error occurred while resending the code: ${e.toString()}';
    } finally {
      setBusy(false);
    }
  }
}
