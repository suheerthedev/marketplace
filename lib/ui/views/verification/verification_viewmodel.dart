import 'package:marketplace/app/app.dialogs.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerificationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
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
      final result = await _authService.verifyOtp(
        email: email!,
        otp: _verificationCode,
      );

      if (result == AuthResult.success) {
        // After successful verification, navigate to login
        _navigationService.navigateToMainView();
      } else {
        // Show error dialog
        await _dialogService.showCustomDialog(
          variant: DialogType.error,
          title: 'Verification Failed',
          description: _authService.errorMessage ??
              'Invalid verification code. Please try again.',
          mainButtonTitle: 'OK',
        );
      }
    } catch (e) {
      // Show error dialog for unexpected errors
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Unexpected Error',
        description: 'An unexpected error occurred. Please try again later.',
        mainButtonTitle: 'OK',
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> resendCode() async {
    if (email == null) {
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Resend Failed',
        description: 'No email address found for verification.',
        mainButtonTitle: 'OK',
      );
      return;
    }

    setBusy(true);

    try {
      final success = await _authService.resendOtp(email: email!);

      if (success) {
        // Show success message
        _errorMessage = 'Verification code resent successfully!';
        notifyListeners();
      } else {
        // Show error dialog
        await _dialogService.showCustomDialog(
          variant: DialogType.error,
          title: 'Resend Failed',
          description: _authService.errorMessage ??
              'Failed to resend verification code. Please try again.',
          mainButtonTitle: 'OK',
        );
      }
    } catch (e) {
      // Show error dialog for unexpected errors
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Unexpected Error',
        description:
            'An error occurred while resending the code. Please try again later.',
        mainButtonTitle: 'OK',
      );
    } finally {
      setBusy(false);
    }
  }
}
