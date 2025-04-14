import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace/models/saved_card.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pay_now_viewmodel.dart';

class PayNowView extends StackedView<PayNowViewModel> {
  const PayNowView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PayNowViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Enter Card Details"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCardForm(viewModel),
                      const SizedBox(height: 20),
                      _buildSavedCardsSection(viewModel),
                    ],
                  ),
                ),
              ),
              CustomButton(
                  title: "Pay",
                  onTap: viewModel.pay,
                  bgColor: brownContainerColor,
                  textColor: secondaryTextColor,
                  borderColor: brownContainerColor)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardForm(PayNowViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputLabel("Card number"),
        _buildTextField(
          hintText: "abc@gmail.com",
          controller: TextEditingController(text: viewModel.cardNumber),
          onChanged: viewModel.setCardNumber,
          isValid: viewModel.isCardNumberValid,
          borderColor: _getBorderColor(
              viewModel.cardNumber.isNotEmpty, viewModel.isCardNumberValid),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputLabel("Expiry Date"),
                  _buildTextField(
                    hintText: "MM/YY",
                    controller:
                        TextEditingController(text: viewModel.expiryDate),
                    onChanged: viewModel.setExpiryDate,
                    isValid: viewModel.isExpiryDateValid,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      _ExpiryDateInputFormatter(),
                    ],
                    borderColor: _getBorderColor(
                        viewModel.expiryDate.isNotEmpty,
                        viewModel.isExpiryDateValid),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputLabel("CVC"),
                  _buildTextField(
                    hintText: "234",
                    controller: TextEditingController(text: viewModel.cvc),
                    onChanged: viewModel.setCvc,
                    isValid: viewModel.isCvcValid,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    borderColor: _getBorderColor(
                        viewModel.cvc.isNotEmpty, viewModel.isCvcValid),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Color _getBorderColor(bool hasValue, bool isValid) {
    if (!hasValue) return Colors.grey[300]!; // Default border color
    return isValid ? Colors.green : Colors.red;
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: mainTextColor,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    required Function(String) onChanged,
    required bool isValid,
    List<TextInputFormatter>? inputFormatters,
    Color borderColor = Colors.grey,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      cursorColor: mainBackgroundColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: mainContainerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
            fontSize: 13, fontWeight: FontWeight.w400, color: lightTextColor),
        suffixIcon: controller.text.isNotEmpty
            ? Icon(
                isValid ? Icons.check_circle : Icons.error_outline,
                color: isValid ? Colors.green : Colors.red,
                size: 20,
              )
            : null,
      ),
    );
  }

  Widget _buildSavedCardsSection(PayNowViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            "Other Account",
            style: GoogleFonts.roboto(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...viewModel.savedCards
            .map((card) => _buildSavedCardItem(card, viewModel))
            .toList(),
      ],
    );
  }

  Widget _buildSavedCardItem(SavedCard card, PayNowViewModel viewModel) {
    final last4Digits = card.number.substring(card.number.length - 4);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () => viewModel.selectCard(card.id),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    card.name.substring(0, 2).toUpperCase(),
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: lightTextColor),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.name,
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: brownTextColor),
                    ),
                    Text(
                      "${card.number.substring(0, 4)} •••• •••• ${last4Digits}",
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      card.paymentType,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Radio<bool>(
                value: true,
                groupValue: card.isSelected,
                onChanged: (_) => viewModel.selectCard(card.id),
                activeColor: const Color(0xFF9F7B5C),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PayNowViewModel viewModelBuilder(BuildContext context) => PayNowViewModel();
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length > 2) {
      final formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }

    return newValue;
  }
}
