import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'seller_trending_products_viewmodel.dart';

class SellerTrendingProductsView
    extends StackedView<SellerTrendingProductsViewModel> {
  const SellerTrendingProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerTrendingProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Trending Products"),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerTrendingProductsView")),
      ),
    );
  }

  @override
  SellerTrendingProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerTrendingProductsViewModel();
}
