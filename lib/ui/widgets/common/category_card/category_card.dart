import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'category_card_model.dart';

class CategoryCard extends StackedView<CategoryCardModel> {
  final String name;
  final String imagePath;
  final IconData icon;
  const CategoryCard(
      {required this.name,
      required this.imagePath,
      required this.icon,
      super.key});

  @override
  Widget builder(
    BuildContext context,
    CategoryCardModel viewModel,
    Widget? child,
  ) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child:
              // Icon(
              //   icon,
              //   size: 40,
              // )
              Image.asset(
            imagePath,
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  @override
  CategoryCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      CategoryCardModel();
}
