import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_card_1_model.dart';

class ProductCard1 extends StackedView<ProductCard1Model> {
  const ProductCard1({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductCard1Model viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  ProductCard1Model viewModelBuilder(
    BuildContext context,
  ) =>
      ProductCard1Model();
}
