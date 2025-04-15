import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'voucher_viewmodel.dart';

class VoucherView extends StackedView<VoucherViewModel> {
  const VoucherView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VoucherViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Your Vouchers"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
              itemCount: viewModel.vouchers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: viewModel.viewVoucher,
                  child: Image.asset(viewModel.vouchers[index]),
                );
              }),
        ),
      ),
    );
  }

  @override
  VoucherViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VoucherViewModel();
}
