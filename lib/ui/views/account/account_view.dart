import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StackedView<AccountViewModel> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AccountViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileSection(viewModel, context),
              const SizedBox(height: 24),
              _buildOrdersSection(viewModel, context),
              const SizedBox(height: 24),
              _buildPromotionsSection(context),
              const SizedBox(height: 24),
              _buildGeneralSection(context, items: viewModel.generalItems),
              const SizedBox(height: 24),
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(
      AccountViewModel viewModel, BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          backgroundImage: const AssetImage('assets/images/profile.png'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ela Mathew',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: viewModel.viewProfile,
              child: Text(
                'View Profile',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrdersSection(AccountViewModel viewModel, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Orders',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: viewModel.viewOrders,
              child: Text(
                'View All Orders',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: lightTextColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildOrderItem(
                image: 'assets/images/icons/money.png',
                label: 'To Pay',
                onTap: viewModel.viewToPay),
            _buildOrderItem(
                image: 'assets/images/icons/star.png',
                label: 'To Review',
                onTap: viewModel.viewToReview),
            _buildOrderItem(
                image: 'assets/images/icons/car.png',
                label: 'To Receive',
                onTap: viewModel.viewToReceive),
            _buildOrderItem(
                image: 'assets/images/icons/return.png',
                label: 'Order Return\n& Cancellation',
                onTap: viewModel.viewOrderReturn),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderItem({
    required String image,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 5,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 0,
                color: brownTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildPromotionCard(
            title: 'Collect Vouchers',
            image: 'assets/images/icons/voucher.png',
            buttonText: 'Collect',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildPromotionCard(
            title: 'Flash Sale',
            image: 'assets/images/icons/sale.png',
            buttonText: 'Shop',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildPromotionCard({
    required String title,
    required String image,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
        color: lightContainerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                fit: BoxFit.contain,
                width: 70,
                height: 70,
              ),
              SizedBox(
                width: 60,
                height: 30,
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: const Color(0xFF996E4E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.roboto(
                        fontSize: 10, color: secondaryTextColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralSection(BuildContext context, {required List items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        _buildGeneralItem(generalItems: items),
      ],
    );
  }

  Widget _buildGeneralItem({required List generalItems}) {
    return SizedBox(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: generalItems.length,
          separatorBuilder: (context, index) => const Divider(height: 0),
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading:
                  Icon(generalItems[index]['icon'], color: mainBackgroundColor),
              title: Text(
                generalItems[index]['title'],
                style: GoogleFonts.roboto(fontSize: 14, color: mainTextColor),
              ),
              trailing:
                  const Icon(Icons.chevron_right, color: lightBackgroundColor),
              onTap: () {},
            );
          }),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF996E4E)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Logout',
          style: GoogleFonts.roboto(
            color: const Color(0xFF996E4E),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  AccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AccountViewModel();
}
