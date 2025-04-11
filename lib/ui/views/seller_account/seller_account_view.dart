import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/common/ui_helpers.dart';
import 'package:marketplace/ui/styles/text_styles.dart';

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
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryBackgroundColor,
        elevation: 0,
        title: Text('My Account', style: AppTextStyles.heading1),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: mainTextColor),
            onPressed: viewModel.openSettings,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileSection(viewModel),
                verticalSpaceMedium,
                _buildShopSection(viewModel),
                verticalSpaceMedium,
                _buildAccountOptionsSection(viewModel),
                verticalSpaceMedium,
                _buildHelpSection(viewModel),
                verticalSpaceMedium,
                _buildLogoutButton(viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(SellerAccountViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightContainerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: const AssetImage('assets/images/profile.jpg'),
          ),
          horizontalSpaceMedium,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: AppTextStyles.heading2,
                ),
                verticalSpaceTiny,
                Text(
                  'johndoe@example.com',
                  style: AppTextStyles.bodyText1,
                ),
                verticalSpaceSmall,
                InkWell(
                  onTap: viewModel.editProfile,
                  child: Row(
                    children: [
                      Text(
                        'Edit Profile',
                        style: AppTextStyles.bodyText1.copyWith(
                          color: kcPrimaryColor,
                        ),
                      ),
                      horizontalSpaceTiny,
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: kcPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShopSection(SellerAccountViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Shop', style: AppTextStyles.heading2),
        verticalSpaceSmall,
        _buildOptionTile(
          icon: Icons.store,
          title: 'Shop Details',
          onTap: viewModel.openShopDetails,
        ),
        _buildOptionTile(
          icon: Icons.payments_outlined,
          title: 'Payment Information',
          onTap: viewModel.openPaymentInfo,
        ),
        _buildOptionTile(
          icon: Icons.local_shipping_outlined,
          title: 'Shipping Settings',
          onTap: viewModel.openShippingSettings,
        ),
      ],
    );
  }

  Widget _buildAccountOptionsSection(SellerAccountViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account Options', style: AppTextStyles.heading2),
        verticalSpaceSmall,
        _buildOptionTile(
          icon: Icons.notifications_outlined,
          title: 'Notifications',
          onTap: viewModel.openNotifications,
        ),
        _buildOptionTile(
          icon: Icons.security,
          title: 'Security & Privacy',
          onTap: viewModel.openSecurityPrivacy,
        ),
      ],
    );
  }

  Widget _buildHelpSection(SellerAccountViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Help & Support', style: AppTextStyles.heading2),
        verticalSpaceSmall,
        _buildOptionTile(
          icon: Icons.help_outline,
          title: 'Help Center',
          onTap: viewModel.openHelpCenter,
        ),
        _buildOptionTile(
          icon: Icons.chat_bubble_outline,
          title: 'Contact Support',
          onTap: viewModel.contactSupport,
        ),
      ],
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: lightContainerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: mainTextColor),
            ),
            horizontalSpaceMedium,
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bodyText1,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(SellerAccountViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: errorColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: viewModel.logout,
        child: Center(
          child: Text(
            'Logout',
            style: AppTextStyles.bodyText1.copyWith(
              color: errorColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  SellerAccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerAccountViewModel();
}
