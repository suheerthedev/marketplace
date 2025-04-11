import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/common/ui_helpers.dart';
import 'package:marketplace/ui/styles/text_styles.dart';
import 'seller_dashboard_viewmodel.dart';

class SellerDashboardView extends StackedView<SellerDashboardViewModel> {
  const SellerDashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerDashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/images/store_logo.png'),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications_outlined,
                  color: mainTextColor),
              onPressed: viewModel.navigateToNotifications,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcomeSection(viewModel),
                verticalSpaceMedium,
                _buildStatCards(viewModel),
                verticalSpaceMedium,
                _buildRecentInvoices(viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(SellerDashboardViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back, Dani',
          style: AppTextStyles.heading1,
        ),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: brownContainerColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Add Product',
                style: AppTextStyles.bodyText1.copyWith(color: brownTextColor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCards(SellerDashboardViewModel viewModel) {
    return Column(
      children: [
        Row(
          children: [
            _buildStatCard(
              title: 'Total Earning',
              value: '\$ 10,000',
              icon: Icons.attach_money,
              iconColor: brownContainerColor,
            ),
            horizontalSpaceSmall,
            _buildStatCard(
              title: 'Total Products',
              value: '45',
              icon: Icons.inventory_2_outlined,
              iconColor: Colors.orange,
            ),
          ],
        ),
        verticalSpaceSmall,
        Row(
          children: [
            _buildStatCard(
              title: 'Total Invoice',
              value: '20',
              icon: Icons.receipt_outlined,
              iconColor: Colors.grey,
            ),
            horizontalSpaceSmall,
            _buildStatCard(
              title: 'Trending Products',
              value: '15',
              icon: Icons.trending_up_outlined,
              iconColor: Colors.brown,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: secondaryContainerColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: brownContainerColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: brownTextColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Icon(icon, color: brownTextColor, size: 20),
              ],
            ),
            verticalSpaceTiny,
            Text(
              value,
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w500,
                  color: mainTextColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentInvoices(SellerDashboardViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Invoice',
          style: GoogleFonts.roboto(
              fontSize: 20,
              letterSpacing: -0.4,
              fontWeight: FontWeight.w600,
              color: mainTextColor),
        ),
        verticalSpaceSmall,
        _buildInvoiceItem(
          invoiceId: '01234',
          productName: 'Product Name',
          amount: '\$ 700',
          isPaid: true,
        ),
        verticalSpaceSmall,
        _buildInvoiceItem(
          invoiceId: '01234',
          productName: 'Product Name',
          amount: '\$ 700',
          isPaid: false,
        ),
      ],
    );
  }

  Widget _buildInvoiceItem({
    required String invoiceId,
    required String productName,
    required String amount,
    required bool isPaid,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0XFFFBFBFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Invoice Id: $invoiceId',
                style: AppTextStyles.bodyText1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: isPaid ? Colors.green.shade100 : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  isPaid ? 'Paid' : 'Pending',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: isPaid ? Colors.green.shade700 : Colors.red.shade700,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
          ),
          Text(
            productName,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: mainTextColor,
            ),
          ),
          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: brownTextColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'View Details',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: brownTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  SellerDashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerDashboardViewModel();
}
