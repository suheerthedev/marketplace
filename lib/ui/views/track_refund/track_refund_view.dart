import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'track_refund_viewmodel.dart';

class TrackRefundView extends StackedView<TrackRefundViewModel> {
  const TrackRefundView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TrackRefundViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("TrackRefundView")),
      ),
    );
  }

  @override
  TrackRefundViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TrackRefundViewModel();
}
