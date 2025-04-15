import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'btn_app_bar_model.dart';

class BtnAppBar extends StackedView<BtnAppBarModel>
    implements PreferredSizeWidget {
  final String title;
  final String btnText;
  final Color btnColor;
  final Color btnBorderColor;
  final Color btnTextColor;
  final Function()? onTap;
  const BtnAppBar(
      {super.key,
      required this.title,
      required this.btnText,
      required this.btnColor,
      required this.btnBorderColor,
      required this.btnTextColor,
      this.onTap});

  @override
  Widget builder(
    BuildContext context,
    BtnAppBarModel viewModel,
    Widget? child,
  ) {
    return AppBar(
      surfaceTintColor: secondaryBackgroundColor,
      backgroundColor: secondaryBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: mainTextColor)),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                  color: btnColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: btnBorderColor)),
              child: Text(btnText,
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: btnTextColor)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  BtnAppBarModel viewModelBuilder(
    BuildContext context,
  ) =>
      BtnAppBarModel();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
