import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_chat_view_viewmodel.dart';

class SellerChatViewView extends StackedView<SellerChatViewViewModel> {
  const SellerChatViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerChatViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerChatViewView")),
      ),
    );
  }

  @override
  SellerChatViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerChatViewViewModel();
}
