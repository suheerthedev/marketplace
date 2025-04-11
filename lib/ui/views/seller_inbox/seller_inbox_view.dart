import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/common/app_colors.dart';

import 'seller_inbox_viewmodel.dart';

class SellerInboxView extends StackedView<SellerInboxViewModel> {
  const SellerInboxView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerInboxViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: secondaryBackgroundColor,
        backgroundColor: secondaryBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Messages",
            style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: mainTextColor)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildChatList(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList(SellerInboxViewModel viewModel) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final bool hasUnread = index % 3 == 0;

        return _buildChatItem(
            userName: "Thomas Jepkins",
            lastMessage:
                'Have you had a chance to review the latest draft of the proposal? I wanted to make sure it meets your requirements',
            imageUrl: 'assets/images/profile.png',
            hasUnread: hasUnread,
            onTap: () {
              viewModel.openChat(index);
            });
      },
    );
  }

  Widget _buildChatItem({
    required String userName,
    required String lastMessage,
    required String imageUrl,
    required bool hasUnread,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(imageUrl),
        backgroundColor: lightContainerColor,
        child: AssetImage(imageUrl).toString().isEmpty
            ? const Icon(Icons.person, color: mainTextColor)
            : null,
      ),
      title: Text(
        userName,
        style: TextStyle(
          fontWeight: hasUnread ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: hasUnread ? Colors.grey : Colors.black,
          fontWeight: hasUnread ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      trailing: hasUnread
          ? null
          : const Icon(Icons.circle, size: 10, color: Colors.blue),
    );
  }

  @override
  SellerInboxViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerInboxViewModel();
}
