import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'seller_edit_product_viewmodel.dart';

class SellerEditProductView extends StackedView<SellerEditProductViewModel> {
  const SellerEditProductView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerEditProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Edit Product Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('Product Image'),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: viewModel.pickImage,
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: lightContainerColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.image, size: 30, color: Colors.grey),
                    const SizedBox(height: 5),
                    Text('Select file',
                        style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: lightTextColor)),
                    const SizedBox(height: 5),
                    Text(
                      'Supported Formats : JPG, PNG only',
                      style: GoogleFonts.roboto(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: lightTextColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// Product Name
            _buildLabel('Product Name'),
            const SizedBox(height: 8),
            _buildTextField(hint: 'Cd Player'),

            /// Category
            const SizedBox(height: 20),
            _buildLabel('Category'),
            const SizedBox(height: 8),
            _buildDropdown(['Cd players'], selected: 'Cd players'),

            /// Brand
            const SizedBox(height: 20),
            _buildLabel('Brand'),
            const SizedBox(height: 8),
            _buildDropdown(['Sony'], selected: 'Sony'),

            /// Description
            const SizedBox(height: 20),
            _buildLabel('Description'),
            const SizedBox(height: 8),
            _buildTextField(
              hint: 'Enter product description',
              maxLines: 3,
              showCounter: true,
              maxLength: 100,
            ),

            /// Price
            _buildLabel('Price'),
            const SizedBox(height: 8),
            _buildCounterField(
              controller: viewModel.priceController,
              onIncrement: viewModel.onIncrementPrice,
              onDecrement: viewModel.onDecrementPrice,
            ),
            const SizedBox(height: 20),

            //Quantity
            _buildLabel('Quantity'),
            const SizedBox(height: 8),
            _buildCounterField(
              controller: viewModel.quantityController,
              onIncrement: viewModel.onIncrementQuantity,
              onDecrement: viewModel.onDecrementQuantity,
            ),

            /// Done Button
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C6B3E), // Brown
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Done',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: secondaryBackgroundColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: label,
              style: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: mainTextColor)),
          TextSpan(
              text: ' *',
              style: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: errorColor)),
        ],
      ),
      style: const TextStyle(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildTextField({
    String? hint,
    int maxLines = 1,
    bool showCounter = false,
    int? maxLength,
  }) {
    return TextField(
      cursorColor: mainBackgroundColor,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.roboto(
            fontSize: 16, fontWeight: FontWeight.w400, color: lightTextColor),
        counterText: showCounter ? null : '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: lightContainerColor),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  Widget _buildDropdown(List<String> items, {String? selected}) {
    return DropdownButtonFormField<String>(
      value: selected,
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: lightTextColor),
                ),
              ))
          .toList(),
      onChanged: (_) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: lightContainerColor),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  Widget _buildCounterField({
    required TextEditingController controller,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: lightContainerColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 60,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                cursorColor: mainBackgroundColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onIncrement,
                  child: const Icon(Icons.arrow_drop_up, size: 20),
                ),
                InkWell(
                  onTap: onDecrement,
                  child: const Icon(Icons.arrow_drop_down, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  SellerEditProductViewModel viewModelBuilder(BuildContext context) =>
      SellerEditProductViewModel();
}
