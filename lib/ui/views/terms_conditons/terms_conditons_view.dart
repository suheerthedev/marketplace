import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  letterSpacing: -0.2,
                  height: 1.5,
                  fontWeight: FontWeight.w300,
                  color: mainTextColor,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              "${index + 1}.",
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                letterSpacing: -0.2,
                                height: 1.5,
                                fontWeight: FontWeight.w300,
                                color: mainTextColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              viewModel.items[index],
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                letterSpacing: -0.2,
                                height: 1.5,
                                fontWeight: FontWeight.w300,
                                color: mainTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  TermsConditonsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TermsConditonsViewModel();
}
