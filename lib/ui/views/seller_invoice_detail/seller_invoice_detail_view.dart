import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_invoice_detail_viewmodel.dart';

class SellerInvoiceDetailView
    extends StackedView<SellerInvoiceDetailViewModel> {
  const SellerInvoiceDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerInvoiceDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerInvoiceDetailView")),
      ),
    );
  }

  @override
  SellerInvoiceDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerInvoiceDetailViewModel();
}
