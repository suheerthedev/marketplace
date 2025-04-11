import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/widgets/common/search_bar/search_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/common/app_colors.dart';

import 'seller_products_viewmodel.dart';

class SellerProductsView extends StackedView<SellerProductsViewModel> {
  const SellerProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: secondaryBackgroundColor,
        backgroundColor: secondaryBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Products",
                style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: mainTextColor)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                  color: brownContainerColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Text("Add Product",
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            Expanded(
              child: _buildProductGrid(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(SellerProductsViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: viewModel.products.length, // Show 4 items as in the design
        itemBuilder: (context, index) {
          final card = viewModel.products[index];
          return _buildProductCard(
            name: card.title,
            image: card.imagePath,
            quantity: '30',
            date: 'Mar 24,2025',
            price: '\$ ${card.price}',
          );
        },
      ),
    );
  }

  Widget _buildProductCard({
    required String name,
    required String image,
    required String quantity,
    required String date,
    required String price,
  }) {
    return SizedBox(
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 0,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                height: 170,
                color: lightContainerColor,
                child: Center(
                  child: Image.asset(image),
                ),
              ),
            ),
            Text(
              softWrap: true,
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: mainTextColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity: $quantity',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            Text(
              price,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),
            )
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            color: secondaryBackgroundColor,
            surfaceTintColor: secondaryBackgroundColor,
            icon: const Icon(Icons.more_vert, size: 20),
            onSelected: (value) {
              if (value == 'edit') {
                // Handle edit action
              } else if (value == 'delete') {
                // Handle delete action
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  height: 0,
                  value: 'edit',
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.edit_outlined, size: 20),
                      Text('Edit Product'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  height: 0,
                  enabled: false,
                  child: Divider(),
                ),
                const PopupMenuItem<String>(
                  height: 0,
                  value: 'delete',
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.delete_outline, size: 20),
                      Text('Delete Product'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ),
      ]),
    );
  }

  @override
  SellerProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerProductsViewModel();
}
