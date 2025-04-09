import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/views/home/home_view.dart';
import 'package:marketplace/ui/widgets/common/category_card/category_card.dart';
import 'package:marketplace/ui/widgets/common/product_card_1/product_card_1.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: secondaryBackgroundColor,
        surfaceTintColor: secondaryBackgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Marketplace",
          style: GoogleFonts.roboto(
            color: mainTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: PageView(
        controller: viewModel.pageController,
        onPageChanged: (index) {
          viewModel.selectedIndex = index;
          viewModel.notifyListeners();
        },
        children: [
          HomeView(), // Replace with your actual screen widgets
          HomeView(),
          HomeView(),
          HomeView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: secondaryBackgroundColor,
        indicatorColor: Colors.transparent,
        selectedIndex: viewModel.selectedIndex,
        onDestinationSelected: viewModel.changeNavbarIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: "Saved",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();
}
