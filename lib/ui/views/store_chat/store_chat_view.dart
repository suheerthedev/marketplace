import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/views/store_chat/store_chat_viewmodel.dart';

class StoreChatView extends StackedView<StoreChatViewModel> {
  const StoreChatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, viewModel),
      body: Column(
        children: [
          Expanded(
            child: Container(), // Empty container for chat messages
          ),
          _buildInputField(context, viewModel),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, StoreChatViewModel viewModel) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              viewModel.storeName,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              "• ${viewModel.lastSeen}",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: const Color(0xFFE0E0E0),
          height: 1.0,
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context, StoreChatViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundColor: brownContainerColor,
            child: const Text(
              "J",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: TextField(
                onChanged: viewModel.updateMessageText,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  hintText: 'Type your message...',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                  border: InputBorder.none,
                ),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  StoreChatViewModel viewModelBuilder(BuildContext context) {
    return StoreChatViewModel();
  }
}
