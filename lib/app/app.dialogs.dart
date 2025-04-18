// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/confirmation/confirmation_dialog.dart';
import '../ui/dialogs/confirmation_two/confirmation_two_dialog.dart';
import '../ui/dialogs/error/error_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';

enum DialogType {
  infoAlert,
  confirmation,
  confirmationTwo,
  error,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.confirmation: (context, request, completer) =>
        ConfirmationDialog(request: request, completer: completer),
    DialogType.confirmationTwo: (context, request, completer) =>
        ConfirmationTwoDialog(request: request, completer: completer),
    DialogType.error: (context, request, completer) =>
        ErrorDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
