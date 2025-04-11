import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'seller_profile_viewmodel.dart';

class SellerProfileView extends StackedView<SellerProfileViewModel> {
  const SellerProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Seller Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            _buildProfileImageSection(),
            const SizedBox(height: 20),
            _buildTextField('Seller Name', 'Enter Name', true),
            const SizedBox(height: 10),
            _buildTextField('Shop Name', 'Enter Name', true),
            const SizedBox(height: 10),
            _buildTextField('Address', 'Select Address', true),
            const SizedBox(height: 10),
            _buildTextField('About Store', 'Description for store', true,
                maxLines: 3, maxLength: 100),
            const Expanded(child: SizedBox()),
            _buildDoneButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImageSection() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: brownContainerColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Positioned(
            bottom: -20,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: lightContainerColor,
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: brownTextColor,
                  size: 30,
                ),
                onPressed: () {
                  // Handle image upload
                },
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: 140,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: brownContainerColor,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add, size: 16, color: Colors.white),
                onPressed: () {
                  // Handle add action
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, bool isRequired,
      {int maxLines = 1, int? maxLength}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label${isRequired ? ' *' : ''}',
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          maxLines: maxLines,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.roboto(
              color: Colors.grey,
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
        ),
      ],
    );
  }

  Widget _buildDoneButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: brownContainerColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          // Handle done action
        },
        child: Text(
          'Done',
          style: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  SellerProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerProfileViewModel();
}
