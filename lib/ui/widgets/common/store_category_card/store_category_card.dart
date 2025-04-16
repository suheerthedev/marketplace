import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'store_category_card_model.dart';

class StoreCategoryCard extends StackedView<StoreCategoryCardModel> {
  final String image;
  final String title;
  const StoreCategoryCard(
      {super.key, required this.image, required this.title});

  @override
  Widget builder(
    BuildContext context,
    StoreCategoryCardModel viewModel,
    Widget? child,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: lightContainerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(image),
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w500, color: mainTextColor),
        ),
      ],
    );
  }

  @override
  StoreCategoryCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreCategoryCardModel();
}
