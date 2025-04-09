import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'store_section_model.dart';

class StoreSection extends StackedView<StoreSectionModel> {
  const StoreSection({super.key});

  @override
  Widget builder(
    BuildContext context,
    StoreSectionModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 14,
                child: const Text(
                  "A",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Abc Store",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: brownContainerColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Visit Store",
                  style: TextStyle(
                    fontSize: 12,
                    color: brownTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSellerRating(
                  "95%",
                  "High",
                  "Positive Seller",
                  Colors.green,
                ),
                Container(
                  height: 24,
                  width: 1,
                  color: Colors.grey[300],
                ),
                _buildSellerRating(
                  "95%",
                  "High",
                  "Ship on Time",
                  Colors.green,
                ),
                Container(
                  height: 24,
                  width: 1,
                  color: Colors.grey[300],
                ),
                _buildSellerRating(
                  "95%",
                  "High",
                  "Chat Response",
                  Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerRating(
      String percentage, String status, String label, Color statusColor) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                percentage,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  color: statusColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  @override
  StoreSectionModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreSectionModel();
}
