import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';

import 'seller_account_viewmodel.dart';

class SellerAccountView extends StackedView<SellerAccountViewModel> {
  const SellerAccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerAccountViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/store_logo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shop Name',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Seller Name',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.black),
              onPressed: viewModel.editProfile,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ListView(
            children: [
              _buildOptionTile(
                icon: Icons.person_outline,
                title: 'Seller Profile',
                onTap: viewModel.openShopDetails,
              ),
              _buildOptionTile(
                icon: Icons.account_balance_wallet_outlined,
                title: 'My Wallet',
                onTap: viewModel.openPaymentInfo,
              ),
              _buildSwitchTile(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                value: viewModel.notificationsEnabled,
                onChanged: viewModel.toggleNotifications,
              ),
              _buildOptionTile(
                icon: Icons.language_outlined,
                title: 'Language - English',
                onTap: () {
                  // Handle language change
                },
              ),
              _buildOptionTile(
                icon: Icons.help_outline,
                title: 'Seller Help Center',
                onTap: viewModel.openHelpCenter,
              ),
              _buildOptionTile(
                icon: Icons.logout,
                title: 'Logout',
                onTap: viewModel.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
        const Divider(height: 1, color: lightBackgroundColor),
      ],
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          contentPadding: const EdgeInsets.only(left: 16, right: 8),
          title: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              onChanged(!value);
            },
            icon: Icon(
              value ? Icons.toggle_on : Icons.toggle_off_outlined,
              size: 30,
              color: value ? mainBackgroundColor : lightBackgroundColor,
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: lightBackgroundColor,
        ),
      ],
    );
  }

  @override
  SellerAccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerAccountViewModel();
}
