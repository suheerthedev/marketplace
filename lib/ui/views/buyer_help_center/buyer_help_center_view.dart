import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'buyer_help_center_viewmodel.dart';

class BuyerHelpCenterView extends StackedView<BuyerHelpCenterViewModel> {
  const BuyerHelpCenterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerHelpCenterViewModel viewModel,
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

          // Chat bot button
          Positioned(
            right: 16,
            bottom: 50,
            child: _buildChatButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(
    BuildContext context,
    BuyerHelpCenterViewModel viewModel,
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

  Widget _buildChatButton() {
    return Row(spacing: 10, children: [
      Container(
        decoration: BoxDecoration(
          color: secondaryContainerColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: mainContainerColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "I'm here to help you",
            style: GoogleFonts.roboto(
              fontSize: 10,
              letterSpacing: -0.2,
              color: mainTextColor,
            ),
          ),
        ),
      ),
      Image.asset(
        'assets/images/chatbot.png',
        width: 50,
        height: 50,
      ),
    ]);

    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.red,
    //     borderRadius: BorderRadius.circular(24),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withOpacity(0.1),
    //         blurRadius: 8,
    //         offset: const Offset(0, 2),
    //       ),
    //     ],
    //   ),
    //   child: Row(
    //     children: [
    //       // Text label
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    //         child: Text(
    //           "I'm here to help you",
    //           style: GoogleFonts.roboto(
    //             fontSize: 12,
    //             color: Colors.black54,
    //           ),
    //         ),
    //       ),

    //       // Chatbot image
    //       Container(
    //         width: 40,
    //         height: 40,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         child: Image.asset(
    //           'assets/images/chatbot.png',
    //           fit: BoxFit.cover,
    //           width: 40,
    //           height: 40,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  @override
  BuyerHelpCenterViewModel viewModelBuilder(BuildContext context) =>
      BuyerHelpCenterViewModel();
}
