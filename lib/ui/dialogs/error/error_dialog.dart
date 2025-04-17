import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'error_dialog_model.dart';

class ErrorDialog extends StackedView<ErrorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ErrorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ErrorDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Error icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: errorColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                color: errorColor,
                size: 30,
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              request.title ?? viewModel.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: mainTextColor,
              ),
            ),
            const SizedBox(height: 10),

            // Description or error message
            if (request.description != null)
              Text(
                request.description!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: lightTextColor,
                ),
              ),

            // Validation errors list
            if (request.data != null &&
                request.data is Map &&
                request.data.containsKey('validationErrors') &&
                request.data['validationErrors'] is Map<String, String> &&
                (request.data['validationErrors'] as Map).isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...(request.data['validationErrors'] as Map<String, String>)
                        .entries
                        .map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• ',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: errorColor,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${entry.key}: ${entry.value}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: lightTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),

            const SizedBox(height: 20),

            // Buttons
            Row(
              children: [
                // Retry button (if provided)
                if (request.data != null &&
                    request.data is Map &&
                    request.data.containsKey('onRetry'))
                  Expanded(
                    child: CustomButton(
                      title: "Try Again",
                      onTap: () {
                        completer(DialogResponse(
                            confirmed: true, data: {'retry': true}));
                      },
                      bgColor: Colors.white,
                      textColor: mainTextColor,
                      borderColor: mainBackgroundColor,
                    ),
                  ),

                // Spacer between buttons
                if (request.data != null &&
                    request.data is Map &&
                    request.data.containsKey('onRetry'))
                  const SizedBox(width: 10),

                // Main button
                Expanded(
                  child: CustomButton(
                    title: request.mainButtonTitle ?? viewModel.mainButtonTitle,
                    onTap: () {
                      completer(DialogResponse(confirmed: true));
                    },
                    bgColor: mainBackgroundColor,
                    textColor: Colors.white,
                    borderColor: mainBackgroundColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  ErrorDialogModel viewModelBuilder(BuildContext context) => ErrorDialogModel(
        title: request.title ?? 'Error',
        description: request.description,
        validationErrors: request.data != null &&
                request.data is Map &&
                request.data.containsKey('validationErrors')
            ? request.data['validationErrors']
            : null,
        onRetry: request.data != null &&
                request.data is Map &&
                request.data.containsKey('onRetry')
            ? request.data['onRetry']
            : null,
        mainButtonTitle: request.mainButtonTitle ?? 'Got it',
      );
}
