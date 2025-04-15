import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_receive_card_model.dart';

class ProductReceiveCard extends StackedView<ProductReceiveCardModel> {
  const ProductReceiveCard({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductReceiveCardModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  ProductReceiveCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductReceiveCardModel();
}
