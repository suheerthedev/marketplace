import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'checkout_viewmodel.dart';

class CheckoutView extends StackedView<CheckoutViewModel> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Shipping Details"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildSectionTitle("Contact"),
                const SizedBox(height: 12),
                _buildTextField("Email", "abc@gmail.com"),
                const SizedBox(height: 4),
                _buildCheckbox(
                    "Email me with news and offers",
                    viewModel.emailNewsletter,
                    (value) => viewModel.setEmailNewsletter(value ?? false)),
                const SizedBox(height: 20),
                _buildSectionTitle("Delivery"),
                const SizedBox(height: 12),
                _buildTextField("Country/Region", "Rome"),
                _buildTextField("Name", "Full Name"),
                _buildTextField("Address", "House No C 97"),
                _buildTextField("Mobile Number", "0333-22222"),
                const SizedBox(height: 4),
                _buildCheckbox(
                    "Save this information for the next time",
                    viewModel.saveInformation,
                    (value) => viewModel.setSaveInformation(value ?? false)),
                const SizedBox(height: 20),
                _buildSectionTitle("Payment"),
                const SizedBox(height: 4),
                _buildSubtitle("All transactions are secure and encrypted"),
                const SizedBox(height: 8),
                _buildPaymentOptions(viewModel),
                const SizedBox(height: 24),
                _buildSectionTitle("Order Summary"),
                const SizedBox(height: 8),
                _buildOrderTotal(),
                const SizedBox(height: 24),
                CustomButton(
                    title: "Next",
                    onTap: viewModel.proceedToPay,
                    bgColor: brownContainerColor,
                    textColor: secondaryTextColor,
                    borderColor: brownContainerColor),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSubtitle(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 12,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            checkColor: secondaryTextColor,
            activeColor: brownContainerColor,
            value: value,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(color: Colors.grey[400]!),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(!value),
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOptions(CheckoutViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildPaymentOption(
            "Debit - Credit Card",
            viewModel.paymentMethod == PaymentMethod.card,
            () => viewModel.setPaymentMethod(PaymentMethod.card),
            backgroundColor: viewModel.paymentMethod == PaymentMethod.card
                ? const Color(0xFFE8D7CB)
                : null,
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[300]),
          _buildPaymentOption(
            "Cash on Delivery (COD)",
            viewModel.paymentMethod == PaymentMethod.cod,
            () => viewModel.setPaymentMethod(PaymentMethod.cod),
            backgroundColor: viewModel.paymentMethod == PaymentMethod.cod
                ? const Color(0xFFE8D7CB)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, bool isSelected, VoidCallback onTap,
      {Color? backgroundColor}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.brown : Colors.grey,
                  width: 2,
                ),
              ),
              child: Center(
                child: isSelected
                    ? Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sub-total",
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Text(
          "\$ 60",
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  CheckoutViewModel viewModelBuilder(BuildContext context) =>
      CheckoutViewModel();
}
