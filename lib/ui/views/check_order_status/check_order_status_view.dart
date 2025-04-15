import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'check_order_status_viewmodel.dart';

class CheckOrderStatusView extends StackedView<CheckOrderStatusViewModel> {
  const CheckOrderStatusView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckOrderStatusViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Order Status"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Delivery illustration
                Center(
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/images/rider.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Track your order section
                Text(
                  'Track Your Order',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: mainTextColor,
                  ),
                ),
                const SizedBox(height: 16),
                // Order tracking timeline
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.trackingSteps.length,
                  itemBuilder: (context, index) {
                    final step = viewModel.trackingSteps[index];
                    final isLastItem =
                        index == viewModel.trackingSteps.length - 1;

                    return _buildTimelineItem(
                      title: step.title,
                      timestamp: step.timestamp,
                      isCompleted: step.isCompleted,
                      isLastItem: isLastItem,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String timestamp,
    required bool isCompleted,
    required bool isLastItem,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Timeline dot
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? const Color(0xFF996E4E)
                      : Colors.grey.shade300,
                  border: Border.all(
                    color: isCompleted
                        ? const Color(0xFF996E4E)
                        : Colors.grey.shade300,
                    width: 3,
                  ),
                ),
              ),
              // Timeline line
              if (!isLastItem)
                Container(
                  width: 1,
                  height: 70,
                  color: Colors.grey.shade300,
                ),
            ],
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.7,
                    color: isCompleted ? mainBackgroundColor : lightTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: lightTextColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      timestamp,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        letterSpacing: -0.7,
                        color: lightTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  CheckOrderStatusViewModel viewModelBuilder(BuildContext context) =>
      CheckOrderStatusViewModel();
}
