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
      appBar: const MainAppBar(title: "Help Center"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: brownTextColor,
              ),
            ),
            Text(
              'To App Help Center',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: brownTextColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Top Questions',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      _buildQuestionTile(viewModel.questions[index]),
                  separatorBuilder: (context, index) => const Divider(
                        height: 0,
                      ),
                  itemCount: viewModel.questions.length),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionTile(String question) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              question,
              style: GoogleFonts.roboto(
                fontSize: 14,
                letterSpacing: -0.2,
                color: mainTextColor,
              ),
            ),
          ),
          const Icon(Icons.expand_more, color: Colors.black),
        ],
      ),
    );
  }

  @override
  BuyerHelpCenterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerHelpCenterViewModel();
}
