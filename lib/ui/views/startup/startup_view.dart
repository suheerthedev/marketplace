import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/styles/text_styles.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 24,
              left: 24,
              right: 16,
              child: Text("Why choose others, if you own this one.com",
                  style: AppTextStyles.mainHeading),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: -120,
              child: Image.asset(
                'assets/images/ob_image.png',
                height: 500,
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            spacing: 10,
            children: [
              CustomButton(
                title: "Continue as Buyer",
                onTap: viewModel.navigateToBuyerSignUpView,
                bgColor: mainBackgroundColor,
                textColor: secondaryTextColor,
                borderColor: mainBackgroundColor,
              ),
              CustomButton(
                title: "Continue as Seller",
                onTap: viewModel.navigateToSellerSignUpView,
                bgColor: secondaryBackgroundColor,
                textColor: mainTextColor,
                borderColor: mainBackgroundColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
