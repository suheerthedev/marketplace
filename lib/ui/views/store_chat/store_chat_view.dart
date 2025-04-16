import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'store_chat_viewmodel.dart';

class StoreChatView extends StackedView<StoreChatViewModel> {
  const StoreChatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("StoreChatView")),
      ),
    );
  }

  @override
  StoreChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreChatViewModel();
}
