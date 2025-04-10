import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              _buildProfileSection(context),
              const SizedBox(height: 24),
              _buildOrdersSection(context),
              const SizedBox(height: 24),
              _buildPromotionsSection(context),
              const SizedBox(height: 24),
              _buildGeneralSection(context),
              const SizedBox(height: 24),
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
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
            Text(
              'View Profile',
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrdersSection(BuildContext context) {
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
            TextButton(
              onPressed: () {},
              child: Text(
                'View All Orders',
                style: GoogleFonts.roboto(
                  color: const Color(0xFF996E4E),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildOrderItem(icon: Icons.payment, label: 'To Pay'),
            _buildOrderItem(icon: Icons.star_border, label: 'To Review'),
            _buildOrderItem(
                icon: Icons.local_shipping_outlined, label: 'To Receive'),
            _buildOrderItem(
                icon: Icons.refresh, label: 'Order Return\n& Cancellation'),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderItem({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF996E4E)),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildPromotionsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildPromotionCard(
            title: 'Collect Vouchers',
            buttonText: 'Collect',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildPromotionCard(
            title: 'Flash Sale',
            buttonText: 'Shop',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildPromotionCard({
    required String title,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF996E4E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralSection(BuildContext context) {
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
        _buildGeneralItem(icon: Icons.help_outline, title: 'Help center'),
        _buildGeneralItem(icon: Icons.business, title: 'App for business'),
        _buildGeneralItem(
            icon: Icons.description_outlined, title: 'Terms & Policies'),
        _buildGeneralItem(icon: Icons.language, title: 'Language - English'),
      ],
    );
  }

  Widget _buildGeneralItem({required IconData icon, required String title}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 14),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[600]),
      onTap: () {},
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
