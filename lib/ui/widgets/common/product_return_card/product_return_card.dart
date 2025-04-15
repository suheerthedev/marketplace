import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_return_card_model.dart';

class ProductReturnCard extends StackedView<ProductReturnCardModel> {
  const ProductReturnCard({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductReturnCardModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  ProductReturnCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductReturnCardModel();
}
