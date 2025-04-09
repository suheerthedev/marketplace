import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'review_card_model.dart';

class ReviewCard extends StackedView<ReviewCardModel> {
  final Map<String, dynamic> review;
  const ReviewCard({required this.review, super.key});

  @override
  Widget builder(
    BuildContext context,
    ReviewCardModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFEEEEEE),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xFFEEEEEE),
                child: Icon(
                  Icons.person_outline,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                review['name'],
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: Colors.amber[600],
                size: 16,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            review['comment'],
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: lightTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "6 days ago",
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  ReviewCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReviewCardModel();
}
