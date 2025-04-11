import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/widgets/common/search_bar/search_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/common/ui_helpers.dart';
import 'package:marketplace/ui/styles/text_styles.dart';

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
        itemCount: 4, // Show 4 items as in the design
        itemBuilder: (context, index) {
          return _buildProductCard(
            name: 'Sony Cd Player',
            image: 'assets/images/cassette.png',
            quantity: '30',
            date: 'Mar 24,2025',
            price: '\$ 60',
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
        const Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert, size: 20),
          ),
        ),
      ]),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Stack(
    //         children: [
    //           AspectRatio(
    //             aspectRatio: 1.2,
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: Colors.grey.shade300,
    //                 borderRadius: const BorderRadius.only(
    //                   topLeft: Radius.circular(8),
    //                   topRight: Radius.circular(8),
    //                 ),
    //               ),
    //               child: Center(
    //                 child: Container(
    //                   width: 80,
    //                   height: 60,
    //                   decoration: BoxDecoration(
    //                     color: Colors.black,
    //                     border: Border.all(color: Colors.yellow, width: 2),
    //                     borderRadius: BorderRadius.circular(4),
    //                   ),
    //                   child: Center(
    //                     child: Container(
    //                       width: 40,
    //                       height: 3,
    //                       color: Colors.yellow,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: 8,
    //             right: 8,
    //             child: Icon(
    //               Icons.more_vert,
    //               color: Colors.grey.shade700,
    //               size: 20,
    //             ),
    //           ),
    //         ],
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(
    //             left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
    //         child: Text(
    //           name,
    //           style: GoogleFonts.roboto(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w500,
    //             color: Colors.black,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
    //         child: Text(
    //           'Quantity: $quantity · $date',
    //           style: GoogleFonts.roboto(
    //             fontSize: 12,
    //             color: Colors.grey.shade700,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
    //         child: Text(
    //           price,
    //           style: GoogleFonts.roboto(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w500,
    //             color: Colors.red,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  @override
  SellerProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerProductsViewModel();
}
