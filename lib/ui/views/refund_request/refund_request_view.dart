import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'refund_request_viewmodel.dart';

class RefundRequestView extends StackedView<RefundRequestViewModel> {
  const RefundRequestView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RefundRequestViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Request Return"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Information
              _buildProductInfo(viewModel),
              const SizedBox(height: 24),

              // Reason for Cancellation Section
              Text(
                'Reason for Cancellation',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Reasons List (Scrollable)
              Expanded(
                child: ListView(
                  children: [
                    ...viewModel.reasons.map((reason) => _buildReasonItem(
                          context: context,
                          reason: reason,
                          isSelected: viewModel.selectedReason == reason,
                          onChanged: (selected) {
                            if (selected) {
                              viewModel.setSelectedReason(reason);
                            }
                          },
                        )),
                    // Other reason text field
                    _buildOtherReasonField(viewModel),
                  ],
                ),
              ),

              CustomButton(
                  title: "Send",
                  onTap: viewModel.submitRequest,
                  bgColor: brownContainerColor,
                  textColor: Colors.white,
                  borderColor: brownContainerColor)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo(RefundRequestViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        Container(
          width: 80,
          height: 80,
          color: Colors.grey.shade200,
          child: const Center(
            child: Icon(
              Icons.photo_camera,
              color: Colors.grey,
              size: 32,
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Product Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.productDetails['companyName'] ?? 'Company name',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                viewModel.productDetails['productName'] ?? 'Product name',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Delivery date : ${viewModel.productDetails['deliveryDate'] ?? '22-feb-2025'}',
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReasonItem({
    required BuildContext context,
    required String reason,
    required bool isSelected,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: isSelected,
              onChanged: (value) => onChanged(value ?? false),
              activeColor: brownContainerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            reason,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherReasonField(RefundRequestViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Others:',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              cursorColor: mainTextColor,
              onChanged: viewModel.setOtherReason,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
              ),
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  RefundRequestViewModel viewModelBuilder(BuildContext context) =>
      RefundRequestViewModel();
}
