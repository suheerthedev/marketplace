import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/models/order_model.dart';
import 'package:marketplace/ui/common/app_colors.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onCheckStatus;
  final VoidCallback onBuyAgain;

  const OrderCard({
    Key? key,
    required this.order,
    required this.onCheckStatus,
    required this.onBuyAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: lightContainerColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        order.imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.productName,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$ ${order.price.toStringAsFixed(2)}',
                          style: GoogleFonts.roboto(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                          ),
                        ),
                        if (order.isDelivered) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Delivered on ${order.deliveryDate}',
                            style: GoogleFonts.roboto(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (!order.isDelivered) ...[
                    // Check Status button for pending orders
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: onCheckStatus,
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Check Status',
                            style: GoogleFonts.roboto(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          // Buy Again button for delivered orders
          if (order.isDelivered) ...[
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 36,
                  child: TextButton(
                    onPressed: onBuyAgain,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF996E4E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text(
                      'Buy again',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
