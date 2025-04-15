import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/btn_app_bar/btn_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buyer_profile_viewmodel.dart';

class BuyerProfileView extends StackedView<BuyerProfileViewModel> {
  const BuyerProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BtnAppBar(
        title: "Profile",
        btnText: "Logout",
        btnColor: secondaryContainerColor,
        btnBorderColor: brownContainerColor,
        btnTextColor: brownTextColor,
        onTap: viewModel.logout,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                _buildProfilePicture(viewModel),
                const SizedBox(height: 20),
                _buildProfileField(
                  value: viewModel.name,
                  icon: Icons.edit,
                  onTap: () => _showEditDialog(context, "Name", viewModel.name,
                      (value) => viewModel.setName(value)),
                ),
                _buildProfileField(
                  value: viewModel.email,
                  icon: Icons.edit,
                  onTap: () => _showEditDialog(context, "Email",
                      viewModel.email, (value) => viewModel.setEmail(value)),
                ),
                _buildProfileField(
                  value: viewModel.password,
                  icon: Icons.visibility,
                  onTap: () {}, // Password visibility toggle would go here
                ),
                _buildProfileField(
                  value: viewModel.address,
                  icon: Icons.edit,
                  onTap: () => _showEditDialog(
                      context,
                      "Address",
                      viewModel.address,
                      (value) => viewModel.setAddress(value)),
                ),
                _buildSaveButton(viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture(BuyerProfileViewModel viewModel) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryBackgroundColor,
            image: DecorationImage(
              image: AssetImage(viewModel.profileImagePath),
              fit: BoxFit.contain,
              onError: (exception, stackTrace) => const Icon(Icons.person),
            ),
          ),
        ),
        GestureDetector(
          onTap: viewModel.updateProfilePicture,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Color(0xFF996E4E),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileField({
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              icon,
              color: Colors.grey[600],
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    String title,
    String initialValue,
    Function(String) onSave,
  ) {
    final textController = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $title'),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'Enter your $title',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onSave(textController.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuyerProfileViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 120,
          height: 40,
          child: ElevatedButton(
            onPressed: viewModel.saveProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF996E4E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Save',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  BuyerProfileViewModel viewModelBuilder(BuildContext context) =>
      BuyerProfileViewModel();
}
