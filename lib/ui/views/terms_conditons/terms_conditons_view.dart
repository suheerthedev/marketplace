import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'terms_conditons_viewmodel.dart';

class TermsConditonsView extends StackedView<TermsConditonsViewModel> {
  const TermsConditonsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TermsConditonsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Terms & Conditions"),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("TermsConditonsView")),
      ),
    );
  }

  @override
  TermsConditonsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TermsConditonsViewModel();
}
