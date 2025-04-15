import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'main_app_bar_model.dart';

class MainAppBar extends StackedView<MainAppBarModel>
    implements PreferredSizeWidget {
  final String title;

  const MainAppBar({required this.title, super.key});

  @override
  Widget builder(
    BuildContext context,
    MainAppBarModel viewModel,
    Widget? child,
  ) {
    return AppBar(
      surfaceTintColor: secondaryBackgroundColor,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: GoogleFonts.roboto(
            color: mainTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  MainAppBarModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainAppBarModel();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
