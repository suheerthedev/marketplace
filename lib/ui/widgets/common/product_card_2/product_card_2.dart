import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_card_2_model.dart';

class ProductCard2 extends StackedView<ProductCard2Model> {
  const ProductCard2({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductCard2Model viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  ProductCard2Model viewModelBuilder(
    BuildContext context,
  ) =>
      ProductCard2Model();
}
