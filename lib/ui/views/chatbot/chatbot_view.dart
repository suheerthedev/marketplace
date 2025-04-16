import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chatbot_viewmodel.dart';

class ChatbotView extends StackedView<ChatbotViewModel> {
  const ChatbotView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatbotViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ChatbotView")),
      ),
    );
  }

  @override
  ChatbotViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatbotViewModel();
}
