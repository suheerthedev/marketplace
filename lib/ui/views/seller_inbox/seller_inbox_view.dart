import 'package:flutter/material.dart';
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
        backgroundColor: secondaryBackgroundColor,
        elevation: 0,
        title: Text('Inbox', style: AppTextStyles.heading1),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: mainTextColor),
            onPressed: viewModel.searchMessages,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildChatTabs(viewModel),
            Expanded(
              child: _buildChatList(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatTabs(SellerInboxViewModel viewModel) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildChatTab('All', true, viewModel),
          horizontalSpaceSmall,
          _buildChatTab('Unread', false, viewModel),
          horizontalSpaceSmall,
          _buildChatTab('Archive', false, viewModel),
        ],
      ),
    );
  }

  Widget _buildChatTab(
      String title, bool isActive, SellerInboxViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? mainBtnColor : lightContainerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: AppTextStyles.bodyText1.copyWith(
          color: isActive ? secondaryTextColor : mainTextColor,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildChatList(SellerInboxViewModel viewModel) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final bool hasUnread = index % 3 == 0;
        return _buildChatItem(
          userName: 'Customer ${index + 1}',
          lastMessage: 'Hello, is this product still available?',
          time:
              '${(index + 1) % 12}:${(index * 10) % 60} ${(index % 2 == 0) ? 'AM' : 'PM'}',
          imageUrl: 'assets/images/avatar${(index % 5) + 1}.jpg',
          hasUnread: hasUnread,
          onTap: () => viewModel.openChat(index),
        );
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
