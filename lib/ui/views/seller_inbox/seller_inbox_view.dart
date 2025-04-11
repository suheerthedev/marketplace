import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/common/ui_helpers.dart';
import 'package:marketplace/ui/styles/text_styles.dart';

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

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: const AssetImage('assets/images/profile.png'),
            backgroundColor: lightContainerColor,
            child:
                const AssetImage('assets/images/profile.png').toString().isEmpty
                    ? const Icon(Icons.person, color: mainTextColor)
                    : null,
          ),
          title: Text(
            'Thomas Jepkins',
            style: TextStyle(
              fontWeight: hasUnread ? FontWeight.normal : FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Have you had a chance to review the latest draft of the proposal? I wanted to make sure it meets your requirements',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: hasUnread ? Colors.grey : Colors.black,
              fontWeight: hasUnread ? FontWeight.normal : FontWeight.bold,
            ),
          ),
          trailing: hasUnread
              ? null
              : Icon(Icons.circle, size: 10, color: Colors.blue),
          onTap: () {
            // mark as read logic
          },
        );
        // return _buildChatItem(
        //   userName: 'Customer ${index + 1}',
        //   lastMessage: 'Hello, is this product still available?',
        //   time:
        //       '${(index + 1) % 12}:${(index * 10) % 60} ${(index % 2 == 0) ? 'AM' : 'PM'}',
        //   imageUrl: 'assets/images/avatar${(index % 5) + 1}.jpg',
        //   hasUnread: hasUnread,
        //   onTap: () => viewModel.openChat(index),
        // );
      },
    );
  }

  Widget _buildChatItem({
    required String userName,
    required String lastMessage,
    required String time,
    required String imageUrl,
    required bool hasUnread,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imageUrl),
              backgroundColor: lightContainerColor,
              child: AssetImage(imageUrl).toString().isEmpty
                  ? const Icon(Icons.person, color: mainTextColor)
                  : null,
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName,
                        style: AppTextStyles.bodyText1.copyWith(
                          fontWeight:
                              hasUnread ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      Text(
                        time,
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          lastMessage,
                          style: AppTextStyles.caption.copyWith(
                            color: hasUnread ? Colors.black : Colors.grey,
                            fontWeight:
                                hasUnread ? FontWeight.bold : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (hasUnread)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: kcPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SellerInboxViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerInboxViewModel();
}
