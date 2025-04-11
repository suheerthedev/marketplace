import 'package:flutter/material.dart';
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
        title: Text('My Products', style: AppTextStyles.heading1),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: mainTextColor),
            onPressed: viewModel.searchProducts,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainBtnColor,
        onPressed: viewModel.addNewProduct,
        child: const Icon(Icons.add, color: secondaryTextColor),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryTabs(viewModel),
            Expanded(
              child: _buildProductGrid(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs(SellerProductsViewModel viewModel) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryTab('All', true, viewModel),
          _buildCategoryTab('Clothing', false, viewModel),
          _buildCategoryTab('Electronics', false, viewModel),
          _buildCategoryTab('Home', false, viewModel),
          _buildCategoryTab('Beauty', false, viewModel),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(
      String title, bool isActive, SellerProductsViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? mainBtnColor : lightContainerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: AppTextStyles.bodyText1.copyWith(
          color: isActive ? secondaryTextColor : mainTextColor,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
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
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 10, // Demo count
        itemBuilder: (context, index) {
          return _buildProductCard(
            name: 'Product ${index + 1}',
            price: "\$60",
            imageUrl: '',
            stockStatus: index % 3 == 0 ? 'Low Stock' : 'In Stock',
            statusColor: index % 3 == 0 ? Colors.orange : Colors.green,
            onTap: () => viewModel.viewProductDetails(index),
          );
        },
      ),
    );
  }

  Widget _buildProductCard({
    required String name,
    required String price,
    required String imageUrl,
    required String stockStatus,
    required Color statusColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: lightContainerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Icon(Icons.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpaceTiny,
                  Text(
                    price,
                    style: AppTextStyles.bodyText1.copyWith(
                      color: kcPrimaryColor,
                    ),
                  ),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        stockStatus,
                        style: AppTextStyles.caption.copyWith(
                          color: statusColor,
                        ),
                      ),
                      const Icon(
                        Icons.more_vert,
                        size: 16,
                        color: iconColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SellerProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerProductsViewModel();
}
