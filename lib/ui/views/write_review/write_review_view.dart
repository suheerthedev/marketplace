import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'write_review_viewmodel.dart';

class WriteReviewView extends StackedView<WriteReviewViewModel> {
  const WriteReviewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WriteReviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Write Review"),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("WriteReviewView")),
      ),
    );
  }

  @override
  WriteReviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WriteReviewViewModel();
}
