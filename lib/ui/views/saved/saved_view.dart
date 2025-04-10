import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:marketplace/ui/widgets/common/product_card_3/product_card_3.dart';
import 'package:stacked/stacked.dart';

import 'saved_viewmodel.dart';

class SavedView extends StackedView<SavedViewModel> {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SavedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Saved Products"),
      body: viewModel.savedProducts.isEmpty
          ? _buildEmptyCart()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                ),
                itemCount: viewModel.savedProducts.length,
                itemBuilder: (context, index) {
                  final product = viewModel.savedProducts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProductCard3(
                      isTappable: true,
                      product: product,
                      onToggleSaved: () => viewModel.toggleSaved(product),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_outline,
              size: 48,
              color: iconColor,
            ),
            const SizedBox(height: 15),
            Text(
              "No Saved Products",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: mainTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Text(
                "When you save products, they'll appear here.",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: lightTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SavedViewModel viewModelBuilder(BuildContext context) => SavedViewModel();
}
