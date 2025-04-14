import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'seller_invoice_detail_viewmodel.dart';

class SellerInvoiceDetailView
    extends StackedView<SellerInvoiceDetailViewModel> {
  const SellerInvoiceDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerInvoiceDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "View Details"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductDetails(),
            const SizedBox(height: 16),
            _buildTransactionDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Card(
      elevation: 0,
      color: lightContainerColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Details",
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: lightBackgroundColor,
            ),
            _buildDetailRow("Product Name", "Sample Product"),
            _buildDetailRow("Invoice Id", "12345"),
            _buildDetailRow("Status", "Pending"),
            _buildDetailRow("Amount", "\$700"),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionDetails() {
    return Card(
      color: lightContainerColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transaction Details",
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: lightBackgroundColor,
            ),
            _buildDetailRow("Bank Name", "Abc Bank"),
            _buildDetailRow("Account Name", "Amna"),
            _buildDetailRow("Account Number", "1234-448794439"),
            _buildDetailRow("Amount", "\$700"),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: lightTextColor),
          ),
          Text(
            value,
            style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: mainTextColor),
          ),
        ],
      ),
    );
  }

  @override
  SellerInvoiceDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerInvoiceDetailViewModel();
}
