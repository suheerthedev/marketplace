import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
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
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Request Return Details"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Return details card
              _buildReturnDetailsCard(viewModel),
              const SizedBox(height: 24),

              // Tracking title
              Text(
                'Track Your Refund Order',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  color: mainTextColor,
                ),
              ),
              const SizedBox(height: 16),

              // Tracking timeline
              Expanded(
                child: _buildTrackingTimeline(viewModel),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReturnDetailsCard(TrackRefundViewModel viewModel) {
    final details = viewModel.returnDetails;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            brownContainerColor,
            Color.fromARGB(165, 153, 111, 78),
          ],
        ), // Brown color
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Return id : ${details['id']}',
            style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: secondaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Reason : ${details['reason']}',
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: secondaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Return Qty : ${details['quantity']}',
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingTimeline(TrackRefundViewModel viewModel) {
    final steps = viewModel.trackingSteps;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (context, index) {
        final step = steps[index];
        final isLastItem = index == steps.length - 1;

        return _buildTimelineItem(
          title: step['title'],
          timestamp: step['timestamp'],
          isCompleted: step['isCompleted'],
          isLastItem: isLastItem,
        );
      },
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
                      ? const Color(0xFFB07B40)
                      : Colors.grey.shade300,
                  border: Border.all(
                    color: isCompleted
                        ? const Color(0xFFB07B40)
                        : Colors.grey.shade300,
                    width: 3,
                  ),
                ),
              ),
              // Timeline line
              if (!isLastItem)
                Container(
                  width: 1,
                  height: 90,
                  color: Colors.grey.shade300,
                ),
            ],
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.5,
                      color:
                          isCompleted ? Colors.black87 : Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        size: 15,
                        color: brownContainerColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        timestamp,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          letterSpacing: -0.5,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  TrackRefundViewModel viewModelBuilder(BuildContext context) =>
      TrackRefundViewModel();
}
