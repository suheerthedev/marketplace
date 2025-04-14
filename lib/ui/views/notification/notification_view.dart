import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Notifications"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildNotificationList(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(NotificationViewModel viewModel) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildNotificationItem(
            userName: "Thomas Jepkins",
            content: 'liked product 3',
            time: '4 min',
            imageUrl: 'assets/images/profile.png',
            onTap: () {});
      },
    );
  }

  Widget _buildNotificationItem({
    required String userName,
    required String content,
    required String time,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(imageUrl),
        backgroundColor: lightContainerColor,
        child: AssetImage(imageUrl).toString().isEmpty
            ? const Icon(Icons.person, color: mainTextColor)
            : null,
      ),
      title: Text(
        userName,
        style: GoogleFonts.roboto(
          color: mainBackgroundColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.roboto(
          color: mainBackgroundColor,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: Text(
        time,
        style: GoogleFonts.roboto(
            fontSize: 10, fontWeight: FontWeight.w400, color: lightTextColor),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
