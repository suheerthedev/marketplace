import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';

class StoreHeader extends StatelessWidget {
  final String storeName;
  final String rating;
  final bool isFollowing;
  final VoidCallback onFollowTap;

  const StoreHeader({
    Key? key,
    required this.storeName,
    required this.rating,
    required this.isFollowing,
    required this.onFollowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: brownContainerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Store icon
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.store,
              color: Colors.white,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          // Store info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeName,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: secondaryTextColor,
                  ),
                ),
                Text(
                  "$rating% overall rating",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),

          // Follow button
          ElevatedButton(
            onPressed: onFollowTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              minimumSize: const Size(0, 30),
            ),
            child: Text(
              isFollowing ? 'Following' : 'Follow',
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: mainTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
