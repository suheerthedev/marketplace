import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'seller_help_center_viewmodel.dart';

class SellerHelpCenterView extends StackedView<SellerHelpCenterViewModel> {
  const SellerHelpCenterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerHelpCenterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Help Center"),
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFB07B40),
                  ),
                ),
                Text(
                  'To App Help Center',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: const Color(0xFFB07B40),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Top Questions',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: viewModel.faqItems.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final faq = viewModel.faqItems[index];
                      return _buildFAQItem(context, viewModel, index, faq);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(
    BuildContext context,
    SellerHelpCenterViewModel viewModel,
    int index,
    FAQItem faq,
  ) {
    return Column(
      children: [
        // Question
        InkWell(
          onTap: () => viewModel.toggleExpansion(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    faq.question,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.2,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                ),
                Icon(
                  faq.isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),

        // Answer (only visible when expanded)
        if (faq.isExpanded)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              faq.answer,
              textAlign: TextAlign.justify,
              style: GoogleFonts.roboto(
                fontSize: 14,
                letterSpacing: -0.2,
                color: mainTextColor,
                fontWeight: FontWeight.w300,
                height: 1.5,
              ),
            ),
          ),
      ],
    );
  }

  @override
  SellerHelpCenterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerHelpCenterViewModel();
}
