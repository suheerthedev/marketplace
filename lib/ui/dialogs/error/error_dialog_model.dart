import 'package:stacked/stacked.dart';

typedef RetryFunction = Future<void> Function();

class ErrorDialogModel extends BaseViewModel {
  final String title;
  final String? description;
  final Map<String, String>? validationErrors;
  final RetryFunction? onRetry;
  final String mainButtonTitle;

  ErrorDialogModel({
    this.title = 'Error',
    this.description,
    this.validationErrors,
    this.onRetry,
    this.mainButtonTitle = 'Got it',
  });
}
