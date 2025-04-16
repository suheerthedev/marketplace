import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/widgets/common/store_category_card/store_category_card.dart';
import 'package:marketplace/ui/widgets/store/store_app_bar/store_app_bar.dart';
import 'package:marketplace/ui/widgets/store/store_header/store_header.dart';
import 'package:stacked/stacked.dart';

import 'store_category_viewmodel.dart';

class StoreCategoryView extends StackedView<StoreCategoryViewModel> {
  const StoreCategoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreCategoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: StoreAppBar(
        onSearchTap: viewModel.onSearchTap,
        onCartTap: viewModel.onCartTap,
        onNotificationTap: viewModel.onNotificationTap,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                StoreHeader(
                    storeName: "Abc Store",
                    rating: "95",
                    isFollowing: true,
                    onFollowTap: () {}),
                const SizedBox(height: 16),
                _buildSectionHeader("Category"),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 26,
                  ),
                  itemCount: viewModel.categories.length,
                  itemBuilder: (context, index) {
                    final category = viewModel.categories[index];
                    return StoreCategoryCard(
                        image: category['image'], title: category['title']);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  @override
  StoreCategoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreCategoryViewModel();
}
